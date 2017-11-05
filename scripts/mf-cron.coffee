# Description:
#   Send MF notice to Slack cronjob
#
# Notes:
#   Private script

# { execSync } = require 'child_process'
# { CronJob } = require 'cron'
# getChannelMembers = require '../utils/getChannelMembers'
#
# { HUBOT_SLACK_MONEY_FORWARD_CHANNEL_ID, HUBOT_GITHUB_TOKEN, HUBOT_MF_FLAG_GIST_ID } = process.env

module.exports = (robot) ->
  # sendMF = ->
  #   res = execSync([
  #     "curl \"https://api.github.com/gists/#{HUBOT_MF_FLAG_GIST_ID}\""
  #   ].join(' ')).toString('utf8')
  #
  #   index = parseInt JSON.parse(res)?.files?['gistfile1.txt']?.content or '0', 10
  #
  #   getChannelMembers(HUBOT_SLACK_MONEY_FORWARD_CHANNEL_ID)
  #   .then (we) ->
  #     we = we.filter (m) -> m isnt robot.adapter.self.id
  #     robot.send(
  #       room: HUBOT_SLACK_MONEY_FORWARD_CHANNEL_ID
  #       """
  #       💰 Money Forward 💰
  #
  #       収入・支出詳細を更新してください
  #       今日の担当は <@#{we[index]}> です
  #
  #       :moneyfwd: <MoneyFwd://home|マネーフォワードを開く>
  #       """
  #     )
  #
  #     execSync [
  #       "curl \"https://api.github.com/gists/#{HUBOT_MF_FLAG_GIST_ID}\""
  #         "-H \"Authorization: token #{HUBOT_GITHUB_TOKEN}\""
  #         '-XPATCH'
  #         "-d '{\"files\": {\"gistfile1.txt\": {\"content\": \"#{if index is (we.length - 1) then 0 else index + 1}\"}}}'"
  #     ].join(' ')
  #   .catch (err) -> console.log err
  #
  # new CronJob('0 30 21 * * 0-6', sendMF).start()
