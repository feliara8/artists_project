# frozen_string_literal: true

require 'rails_helper'

describe 'POST artists/:artist_id/albums/:album_id/songs', type: :request do
  let(:artist) { create(:artist, name: 'Green Day') }
  let(:album) { create(:album, name: 'Dookie', released_at: 1.year.ago, artist_id: artist.id) }
  let(:song) { Song.last }
  subject { post artist_album_songs_path(artist_id: artist.id, album_id: album.id), params: params, as: :json }

  let(:name) { 'basket case' }
  let(:track_number) { 1 }
  let(:duration) { 60 }

  let(:params) do
    {
      song: {
        name: name,
        track_number: track_number,
        duration: duration
      }
    }
  end

  it 'returns a successful response' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'creates the song' do
    expect { subject }.to change(Song, :count).by(1)
  end

  it 'returns the created Song' do
    subject

    expect(json[:song][:id]).to eq(song.id)
    expect(json[:song][:name]).to eq(song.name)
  end

  context 'without name' do
    let(:name) { '' }

    it 'does return bad request' do
      subject
      expect(response.status).to eq(400)
    end
  end
end
