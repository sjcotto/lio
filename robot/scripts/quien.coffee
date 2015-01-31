# Description:
#   Fill your chat with some kindness
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot quien  - p.e quien paga la cerveza
#
# Author:
#   santiago cotto

users = [
  "@sjcotto:",
  "@melobor:",
  "@gonzalomelov:",
  "@tatin:"
]

module.exports = (robot)->
  robot.respond /quien (.*)/i, (message)->
    rnd = Math.floor Math.random() * users.length
    message.send users[rnd]
