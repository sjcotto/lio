# Description:
#   Allows Hubot to help you decide between multiple options
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot que preferis "<option 1>" "<option 2>" "<option x>" - Randomly picks an option
#   hubot que preferis <option1> <option2> <option3> - Randomly picks an option
#

module.exports = (robot) ->
    robot.respond /que preferis "(.*)"/i, (msg) ->
        options = msg.match[1].split('" "')
        msg.reply("Y... \"#{ msg.random options }\".")

    robot.respond /que preferis ([^"]+)/i, (msg) ->
        options = msg.match[1].split(' ')
        msg.reply("Y... \"#{msg.random options}\".")
