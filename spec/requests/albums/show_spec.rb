# frozen_string_literal: true

require 'rails_helper'

describe 'GET artists/:artist_id/albums/:album_id', type: :request do
  let!(:artist) { create(:artist, name: 'Green Day') }
  let!(:album) { create(:album, name: 'name', released_at: 1.year.ago, artist_id: artist.id) }
  let!(:song) { create(:song, name: 'basket case', duration: 60, track_number: 1, album_id: album.id) }
  subject { get artist_album_path(artist.id, album.id), as: :json }

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'returns the album with artists' do
    subject

    expect(json[:album][:id]).to eq(album.id)
    expect(json[:album][:name]).to eq(album.name)
    expect(json[:album][:songs][0][:name]).to eq(song.name)
  end
end
