# Description:
#   Get a random developer or designer excuse
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ovacion - Get the first news at ovacion digital
#
# Author:
#   santiago cotto

fs = require('fs');
request = require('request');
cheerio = require('cheerio');


module.exports = (robot) ->
  robot.respond /(?:ovacion)(?: me)?/i, (msg) ->

    request "http://www.ovaciondigital.com.uy", (error, response, html) ->
      unless error
        $ = cheerio.load(html)

        $(".column5").filter ->

          data = $(this)
          text = data.children().first().text()

          img = ""
          s = data.children().first().html()
          if (s.indexOf("<img src")>-1)
            img = s.split('<img src="')[1].split('"')[0];
          msg.send text + "http://www.ovaciondigital.com.uy/" + img + "?flag" + new Date().getTime()
