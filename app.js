var Slack = require('slack-client');
var S = require('string');
var youtube = require('./src/youtube.js');
var help = require('./src/help.js');

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
    
    if (type === 'message' && text && isC("", text)) {

        console.log('Received: %s %s @%s %s "%s"', type, (channel.is_channel ? '#' : '') + channel.name, user.name, time, text);

        var command = S(text).between('!', ' ').s;

        if (isC("youtube", text) || isC("ver", text)) {
            var params = S(text).replaceAll('!' + command, '').s;
            youtube.send(params, channel);
        } else if (isC("help", text)) {
            help.send(channel);
        } else {
            response = text.split('').reverse().join('');
            channel.send(response);
        }
    }

});

slack.on('error', function (error) {

    console.error('Error: %s', error);
});

slack.login();

var isC = function (str, text) {
    return new RegExp("^!" + str).test(text)
};