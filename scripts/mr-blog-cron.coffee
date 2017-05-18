# Description:
#   Monthly report to blog cronjob

{ CronJob } = require 'cron'
fetch = require 'node-fetch'

{ HUBOT_BLOG_BUILDER_CIRCLE_TOKEN: TOKEN } = process.env

module.exports = (robot) ->
  executeMonthlyReport = ->
    fetch(
      "https://circleci.com/api/v1/project/sugarshin/build.log.sugarshin.net/tree/monthly-report?circle-token=#{TOKEN}"
      method: 'POST'
    )

  new CronJob('0 01 00 01 * *', executeMonthlyReport).start()
