# Description:
#   Tamagawa Webcam
#
# Notes:
#   Private script

# { CronJob } = require 'cron'

# { HUBOT_SLACK_TAMAGAWA_WEBCAM_CHANNEL_ID } = process.env

module.exports = (robot) ->
  # sendToSlack = ->
  #   imageUrl = "http://www.ktr.mlit.go.jp/keihin/webcam/cam_nikotama_rise.jpg?_d=#{Date.now()}"
  #   robot.send(
  #     room: HUBOT_SLACK_TAMAGAWA_WEBCAM_CHANNEL_ID
  #     """
  #     @here #{imageUrl}
  #     """
  #   )

  # new CronJob('*/15 * * * *', sendToSlack).start()
