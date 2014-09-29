GS = require 'grooveshark-streaming'

# Searching for song_name on Grooveshark
module.exports.getData = (song, callback) ->
  console.log("Getting info.")
  # Getting SongID
  GS.Tinysong.getSongInfo song, '', (err, info) ->
    if err or not info # Not found
      console.log("Not found.")
      # Cannot return err because GS has a bug and returns null
      return callback(err or true)
    console.log("Got info", info)
    callback null, {
      artist: info.ArtistName
      title: info.SongName
      id: info.SongID
    }


module.exports.getStreamingUrl = (songId, callback) ->
  console.log("Getting streamUrl.")
  GS.Grooveshark.getStreamingUrl songId, (err, streamUrl) ->
    console.log("Got streamUrl '#{streamUrl}.'")
    if err # Could not fetch streamUrl
      console.log("Error getting stream url.", err)
      return callback(err)

    callback(null, streamUrl)