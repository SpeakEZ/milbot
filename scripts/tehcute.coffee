# tehcute - Return random img from tehcute.com

# Random img from tehcute.com
# By - github.com/geothird
Select      = require( "soupselect" ).select
HTMLParser  = require "htmlparser"
imgsite     = "http://www.tehcute.com"

module.exports = (robot)->
  robot.respond /tehcute( me)?/i, (message)->
    send_img message, false, (text)->
      message.send text

send_img = (message, location, response_handler)->
  location ||= imgsite + "/random-cuteness.html"
  message.http( location ).get() (error, response, body)->
    return response_handler "No cuteness for you.." if error

    if response.statusCode == 301
      location = response.headers['location']
      return send_img( message, location, response_handler )

    response_handler imgsite + get_img( body, "#left-content div .pic" )

get_img = (body, selector)->
  html_handler  = new HTMLParser.DefaultHandler( (()->), ignoreWhitespace: true )
  html_parser   = new HTMLParser.Parser html_handler

  html_parser.parseComplete body
  Select( html_handler.dom, selector )[0].attribs.src
