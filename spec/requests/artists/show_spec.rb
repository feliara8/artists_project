# frozen_string_literal: true

require 'rails_helper'

describe 'GET artists/:artist_id', type: :request do
  let!(:artist) { create(:artist, name: 'Green Day') }
  let!(:album) { create(:album, name: 'name', released_at: 1.year.ago, artist_id: artist.id) }

  subject { get artist_path(artist.id), as: :json }

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'returns the artist with albums' do
    subject

    expect(json[:artist][:id]).to eq(artist.id)
    expect(json[:artist][:name]).to eq(artist.name)
    expect(json[:artist][:albums][0][:name]).to eq(album.name)
  end
end
