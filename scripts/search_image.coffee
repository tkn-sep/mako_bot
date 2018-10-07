# Commands:
#   hubot image

module.exports = (robot) ->
  
#  robot.respond /image(.*)/i, (msg) ->
#    
#    searchText = msg.match[1]
#    searchText ||= '猫'
#    
#    uri        = "https://www.googleapis.com/customsearch/v1"
#    
#    request = robot.http(uri)
#                   .query(q: searchText, searchType: 'image')
#                   .get()
#                   
#    request (err, res, body) ->
#    
#      if err
#        msg.send "sorry, #{msg.message.user.name}. I cannot understand..."
#        
#      try
#        json = JSON.parse body
#        random_params = Math.floor(Math.random() * json.items.length)
#        link = json.items[random_params].link
#        
#        robot.logger.info "link: #{link}"
#        robot.logger.info "param: #{random_params}"
#        
#        msg.send link
#        
#      catch e
#        robot.logger.info e
#        msg.send e
