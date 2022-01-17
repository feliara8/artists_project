# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE artists/:artist_id/albums/:album_id/songs/:song_id', type: :request do
  let(:artist) { create(:artist, name: 'Green Day') }
  let(:album) { create(:album, name: 'Dookie', released_at: 1.year.ago, artist_id: artist.id) }
  let(:song) {  create(:song, name: 'basket case', duration: 60, track_number: 1, album_id: album.id) }
  subject { delete artist_album_song_path(artist.id, album.id, song.id), as: :json }

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end
end
