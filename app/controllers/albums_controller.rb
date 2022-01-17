# frozen_string_literal: true

class AlbumsController < ApplicationController
  def show
    @album = Album.includes(:songs).find(params[:id])
  end

  def create
    @album = Album.create!(album_params.merge(artist_id: params[:artist_id]))
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
  end

  def update
    @album = Album.find(params[:id])
    @album.update!(album_params)
  end

  def album_params
    params.require(:album).permit(:name, :released_at,
                                  songs_attributes: %i[id name track_number duration genre _destroy])
  end
end
