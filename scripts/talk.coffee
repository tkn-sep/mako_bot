# Commands:
#   hubot image

module.exports = (robot) ->
  
  robot.respond /talk(.*)/i, (msg) ->
    
    talkText = msg.match[1]
    talkText ||= '猫'
    
    uri        = "https://chatbot-api.userlocal.jp/api/chat"
    
    request = robot.http(uri)
                   .query(message: talkText, key: '3249ad8e8790d2b8b4c4')
                   .get()
                   
    request (err, res, body) ->
    
      if err
        msg.send "sorry, #{msg.message.user.name}. I cannot understand..."
        
      try
        json = JSON.parse body
        result = json.result
        
        robot.logger.info "result: #{result}"
        
        msg.send result
        
      catch e
        robot.logger.info e
        msg.send e
