# frozen_string_literal: true

json.album do
  json.partial! 'album', album: @album
  json.artist do
    json.partial! 'artists/artist', artist: @album.artist
  end
  json.songs do
    json.partial! 'songs/song', collection: @album.songs.map(&:decorate), as: :song
  end
end
