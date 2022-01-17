# frozen_string_literal: true

require 'rails_helper'

describe 'GET artists/:artist_id/albums/:album_id/songs/:song_id', type: :request do
  let!(:artist) { create(:artist, name: 'Green Day') }
  let!(:album) { create(:album, name: 'name', released_at: 1.year.ago, artist_id: artist.id) }
  let(:song) {  create(:song, name: 'basket case', duration: 60, track_number: 1, album_id: album.id) }

  subject { get artist_album_song_path(artist.id, album.id, song.id), as: :json }

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'returns the song with album' do
    subject

    expect(json[:song][:id]).to eq(song.id)
    expect(json[:song][:name]).to eq(song.name)
    expect(json[:song][:album][:name]).to eq(album.name)
  end
end
