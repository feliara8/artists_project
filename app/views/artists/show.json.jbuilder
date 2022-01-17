# frozen_string_literal: true

json.artist do
  json.partial! 'artist', artist: @artist
  json.albums do
    json.partial! 'albums/album', collection: @artist.albums, as: :album
  end
end
