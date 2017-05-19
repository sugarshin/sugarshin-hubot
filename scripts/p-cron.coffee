# Description:
#   Send P to Slack cronjob
#
# Notes:
#   Private script

{ CronJob } = require 'cron'
github = require 'githubot'
{ random } = require 'lodash'
decodeMarkdown = require '../utils/decodeGitHubMarkdown'

{ HUBOT_SLACK_PROMISE_CHANNEL_ID: PROMISE_CHANNEL } = process.env

module.exports = (robot) ->
  sayPromise = ->
    fileName = encodeURIComponent('約束事')
    github.get "repos/sugarshin/myfam/contents/cd/#{fileName}.md", {}, (res) ->
      content = decodeMarkdown res.content
      splited = content.split '\n'
      headers = splited
        .filter((row) -> /^##\s+.+/.test row)
        .map((row, i) -> { text: row, index: splited.indexOf(row) })
      commonHeader = headers.find (h) -> /^##\s+共通/.test h.text
      orderedListRegex = /^\d+\.\s+.+/
      commonPromises = splited[(commonHeader.index + 1)...headers[1].index].filter (row) -> orderedListRegex.test row
      promises0 = splited[(headers[1].index + 1)...headers[2].index].filter (row) -> orderedListRegex.test row
      promises1 = splited[(headers[2].index + 1)...splited.length].filter (row) -> orderedListRegex.test row

      selectedCommon = commonPromises[random(0, commonPromises.length - 1)]
      { promise, name } = [
        {
          name: headers[1].text.replace /^##\s+/, ''
          promise: promises0
        }
        {
          name: headers[2].text.replace /^##\s+/, ''
          promise: promises1
        }
      ][random(0, 1)]
      selectedPerson = promise[random(0, promise.length - 1)]

      robot.send(
        room: PROMISE_CHANNEL
        """
        👨‍👩‍👧‍👧 約束事 👨‍👩‍👧‍👧

        ✅ #{commonHeader.text.replace /^##\s+/, ''}： #{selectedCommon}
        ✅ #{name}： #{selectedPerson}

        <https://github.com/sugarshin/myfam/blob/master/cd/#{fileName}.md|約束事を見る> @here
        """
      )

  new CronJob('0 00 14,22 * * 0-6', sayPromise).start()
