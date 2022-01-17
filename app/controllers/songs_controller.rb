# frozen_string_literal: true

class SongsController < ApplicationController
  def create
    @song = Song.create!(song_params.merge(album_id: params[:album_id]))
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
  end

  def song_params
    params.require(:song).permit(:name, :duration, :genre, :track_number)
  end
end
