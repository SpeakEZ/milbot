# Build Jenkins stuffs
#
# You need to set the following variables:
#   HUBOT_JENKINS_URL = "http://git.middil.com:8080"
#   HUBOT_JENKINS_JOB: if not set you will have to specify job name every time
#   HUBOT_JENKINS_AUTH: for authenticating the trigger request (user:apiToken)
# Optional parameter:
#   HUBOT_JENKINS_TOKEN: for authenticating job with token
#
# build job - starts a build for job
module.exports = (robot) ->
  robot.respond /build\s?(.*)/i, (msg) ->

    url = process.env.HUBOT_JENKINS_URL

    job = msg.match[1] || process.env.HUBOT_JENKINS_JOB

#    json_val = JSON.stringify parameter: [{name: job_parameter, value: branch}]
    json_val = JSON.stringify parameter: [{}]

    req = msg.http("#{url}/job/#{job}/build/api/json")

    if process.env.HUBOT_JENKINS_AUTH
      auth = new Buffer(process.env.HUBOT_JENKINS_AUTH).toString('base64')
      req.headers Authorization: "Basic #{auth}"

    req.headers 'Content-Type': 'application/x-www-form-urlencoded'
    req.post("json=#{json_val}") (err, res, body) ->
        if err
          msg.send "Jenkins says wtfm8: #{err}"
        else if res.statusCode == 302
          msg.send "Build started for #{job}! #{url}/job/#{job}"
        else
          msg.send "Jenkins says: #{body}"
