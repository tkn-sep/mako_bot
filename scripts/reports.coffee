# Commands:
#   hubot wreport
#   hubot mreport

request = require 'request'

module.exports = (robot) ->
  
  robot.respond /wreport(.*)/i, (msg) ->
    
    report_work 'weekly', msg
    
  robot.respond /mreport(.*)/i, (msg) ->
  
    report_work 'monthly', msg
    
report_work = (type, msg) ->

  uri = "https://script.google.com/macros/s/AKfycbygzhgzR8lNZqcfY98pq1lIMs4lbjNWO8NaXP9tqEQRbDPp7NNh/exec"

  options = 
    uri: uri
    method: "POST"
    timeout: 2000
    followRedirect: true
    followAllRedirects: true
    encoding: null
    strictSSL: false
    form: {report: type}

  request options, (err, res, body) ->

    if err
      msg.send "sorry, #{msg.message.user.name}. I cannot understand..."
      
    try
      
      json = JSON.parse body
      
      if json.message.length is 0
        msg.send '現時点で提出を検知していないのは以下の方々です。'
        msg.send '全員の提出を確認しました！お疲れ様です！'
        
      else
        msg.send '現時点で提出を検知していないのは以下の方々です。'
        msg.send json.message
      
    catch e
      msg.send e