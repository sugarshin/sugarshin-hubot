fetch = require 'node-fetch'

module.exports = (channelID) -> new Promise (resolve, reject) ->
  fetch(
    "https://slack.com/api/channels.list?token=#{process.env.HUBOT_SLACK_TOKEN}"
  )
  .then (res) -> res.json()
  .then (json) ->
    if (json.ok)
      channel = json.channels.find c -> c.id is channelID
      resolve channel?.members or []
    else
      reject new Error json.error or 'Unknown error'
  .catch (err) -> reject err
