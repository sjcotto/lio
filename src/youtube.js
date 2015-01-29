/**
 * Created by santiago on 1/18/15.
 */

(function () {

    var youtube = require('youtube-feeds');

    module.exports.send = function (params, channel) {
        youtube.feeds.videos({q: params}, function (err, data) {
            if (err instanceof Error) {
                console.log(err)
            } else {
                var r = Math.floor(Math.random() * data.items.length);
                var url = data.items[r].player.default;
                channel.send(url);
            }
        });
    }
}());



