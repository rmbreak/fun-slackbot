# Description:
#   Get uptime of the server.
#
# Commands:
#   hubot uptime - Display server uptime.

Process = require("child_process")

module.exports = (robot) ->

    getUptime = (callback) ->
        uptime = Process.spawn("uptime")
        uptime.stdout.on "data", callback

    robot.respond /uptime/i, (res) ->
        getUptime (data) ->
            res.send data.toString "utf8"
