# Commands:
#   hubot image

module.exports = (robot) ->
  
  robot.respond /修造/i, (msg) ->
    msg.reply msg.random [
      'https://se-p.slack.com/files/UCKEQBP3Q/FDDKS449W/epson001.jpg',
      'https://se-p.slack.com/files/UCKEQBP3Q/FDE79QKM2/epson002.jpg',
      'https://se-p.slack.com/files/UCKEQBP3Q/FDEJ2RML5/epson003.jpg',
      'https://se-p.slack.com/files/UCKEQBP3Q/FDE7BLJ6Q/epson004.jpg',
    ]
