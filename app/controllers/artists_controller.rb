# frozen_string_literal: true

class ArtistsController < ApplicationController
  def create
    @artist = Artist.create!(artist_params)
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
  end

  def artist_params
    params.require(:artist).permit(:name, :born_at, :biography)
  end
end
