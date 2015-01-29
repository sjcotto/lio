// This is a simple example of how to use the slack-client module. It creates a
// bot that responds to all messages in all channels it is in with a reversed
// string of the text received.
//
// To run, copy your token below, then:
//	npm install
// 	cd examples
// 	node simple.js

var Slack = require('slack-client');
var S = require('string');
var youtube = require('youtube-feeds');


var token = 'xoxb-3541188341-XOHh7nkFOwxLbBqTfwwndTev', // Add a bot at https://my.slack.com/services/new/bot and copy the token here.
    autoReconnect = true,
    autoMark = true;

var slack = new Slack(token, autoReconnect, autoMark);

slack.on('open', function () {

    var channels = [],
        groups = [],
        unreads = slack.getUnreadCount(),
        key;

    for (key in slack.channels) {
        if (slack.channels[key].is_member) {
            channels.push('#' + slack.channels[key].name);
        }
    }

    for (key in slack.groups) {
        if (slack.groups[key].is_open && !slack.groups[key].is_archived) {
            groups.push(slack.groups[key].name);
        }
    }

    console.log('Welcome to Slack. You are @%s of %s', slack.self.name, slack.team.name);
    console.log('You are in: %s', channels.join(', '));
    console.log('As well as: %s', groups.join(', '));
    console.log('You have %s unread ' + (unreads === 1 ? 'message' : 'messages'), unreads);
});

slack.on('message', function (message) {

    var type = message.type,
        channel = slack.getChannelGroupOrDMByID(message.channel),
        user = slack.getUserByID(message.user),
        time = message.ts,
        text = message.text,
        response = '';


    /*
     youtube api
     */

    try {

        if (type === 'message' && S(text).startsWith("!")) {

            console.log('Received: %s %s @%s %s "%s"', type, (channel.is_channel ? '#' : '') + channel.name, user.name, time, text);

            var command = S(text).between('!', ' ').s;
            console.log(command);
            if (command == 'youtube' || command == 'ver') {
                var params = S(text).replaceAll('!' + command, '').s;

                youtube.feeds.videos({q: params}, function (err, data) {
                    if (err instanceof Error) {
                        console.log(err)
                    } else {
                        var r = Math.floor(Math.random() * data.items.length);
                        var url = data.items[r].player.default;
                        response = url;
                        channel.send(url);
                        console.log('@%s responded with "%s"', slack.self.name, response);
                    }
                });
            }
        } else {
            // Respond to messages with the reverse of the text received.
            response = text.split('').reverse().join('');
            channel.send(response);
            console.log('@%s responded with "%s"', slack.self.name, response);
        }
    } catch (e) {
        console.log(e);
    }


});

slack.on('error', function (error) {

    console.error('Error: %s', error);
});

slack.login();
