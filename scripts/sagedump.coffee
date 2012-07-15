# Sagedump
#
# ask: <your question here>? - Returns an answer to your question
# add: <your question here>? <your answer here> - Adds the dump
#
# You will need to add the following environment variable
#    HUBOT_SAGEDUMP_KEY = "<your user api key from sagedump.com>"
# The key can be generated and is located under the env link after logging in.
#

# Sagedump configuration
base_url = "http://sagedump.com"
api_key  = "?api_key="+ process.env.HUBOT_SAGEDUMP_KEY

search_api = "/search.json"
dumps_api  = "/dumps.json"

module.exports = (robot) ->
  # Ask the sages a question
  robot.hear /ask\: (.*)\?/i, (msg) ->
    get_answer msg, (answer) ->
      msg.send answer

  # Create a new dump from robot input
  robot.hear /add\: (.*)\? (.*)/i, (msg) ->
    add_question msg, (response) ->
      msg.send response

  # Get an answer from sagedump
  get_answer = (msg, answer_handler) ->
    goto = "#{base_url}#{search_api}?absolute=false&query=#{encodeURI(msg.match[1])}"
    msg.http(goto).get() (error, response, body) ->
      return answer_handler "Question reset by peer." if error
      return answer_handler "Answer reset by peer."   if response.statusCode == 404
      return answer_handler "Access denied noob."     if response.statusCode == 403
      return answer_handler "This should work.."      if response.statusCode == 401
      return answer_handler "Server got pwnt."        if response.statusCode == 500

      answers = JSON.parse(body)

      if answers && answers.length > 0
        for answer in answers
          if answer.answer
            answer_handler answer.answer
          else
            answer_handler "The sages have no idea."
          break
      else
        answer_handler "The sages have no clue."

  # Add a question to sage dump using api_key
  add_question = (msg, question_handler) ->
    addto = base_url + dumps_api + api_key
    pkg =
      dump:
        question: msg.match[1]+'?'
        answer: msg.match[2]
    req = msg.http(addto)

    req.headers 'Content-Type': 'application/json'
    req.post(JSON.stringify(pkg)) (error, response, body) ->
      return question_handler "Question reset by peer." if error
      return question_handler "Question reset by peer." if response.statusCode == 404
      return question_handler "Access denied noob."     if response.statusCode == 403
      return question_handler "Server got pwnt."        if response.statusCode == 500
      return question_handler "Forgot your key?"        if response.statusCode == 401

      dump = JSON.parse(body)

      if dump
        question_handler "Successfully added question."
      else
        question_handler "Hrmm.. not sure what happened."

