# frozen_string_literal: true

class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.create!(song_params.merge(album_id: params[:album_id]))
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
  end

  def update
    @song = Song.find(params[:id])
    @song.update!(song_params)
  end

  def song_params
    params.require(:song).permit(:name, :duration, :genre, :track_number, :featured_image, :featured_image_text)
  end
end
