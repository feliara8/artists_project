# frozen_string_literal: true

json.song do
  json.partial! 'song', song: @song.decorate
  json.album do
    json.partial! 'albums/album', album: @song.album
  end

  if @song.featured_image.attached?
    json.featured_image_url @song.decorate.featured_image_url
    json.featured_image_text @song.featured_image_text
  end
end
