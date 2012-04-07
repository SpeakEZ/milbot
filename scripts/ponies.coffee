# Ponies talk about ponies get a pony!
#
# <pony or pony names> - returns a pony!
#

ponies = [
  "http://i.imgur.com/ZY4aF.jpg",
  "http://i.imgur.com/4kJMP.jpg",
  "http://i.imgur.com/X2jKj.jpg",
  "http://i.imgur.com/toRvq.jpg",
  "http://i.imgur.com/pkmXh.jpg",
  "http://i.imgur.com/uSk7L.jpg",
  "http://i.imgur.com/o9tWO.jpg",
  "http://i.imgur.com/o90dD.jpg",
  "http://i.imgur.com/LqHbC.jpg",
  "http://i.imgur.com/aUBTZ.jpg",
  "http://i.imgur.com/jNXyk.jpg",
  "http://i.imgur.com/azZ7j.jpg",
  "http://i.imgur.com/0yIOl.jpg",
  "http://i.imgur.com/ryvg1.jpg",
  "http://i.imgur.com/fGwa5.jpg",
  "http://i.imgur.com/fahNG.jpg",
  "http://i.imgur.com/dHdKO.jpg",
  "http://i.imgur.com/rLlig.jpg",
  "http://i.imgur.com/dHdKO.jpg",
  "http://i.imgur.com/rLlig.jpg",
  "http://i.imgur.com/JQJzd.jpg"
]

module.exports = (robot) ->
  robot.hear /.*(pony|ponies|friendship|magic|twilight sparkle|applejack|pinkie pie|rarity|rainbow).*/i, (msg) ->
    msg.send msg.random ponies