# Commands:
#   hubot image

module.exports = (robot) ->
  
  robot.respond /修造/i, (msg) ->
    msg.reply msg.random [
      'https://slack-files.com/T1J4J1876-FDDKS449W-ac07d2449b',
      'https://slack-files.com/T1J4J1876-FDE79QKM2-ce2fb617e1',
      'https://slack-files.com/T1J4J1876-FDEJ2RML5-89f4dff4b2',
      'https://slack-files.com/T1J4J1876-FDE7BLJ6Q-7c2f5e184e',
    ]
