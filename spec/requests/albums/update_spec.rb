# frozen_string_literal: true

require 'rails_helper'

describe 'PUT artists/:artist_id/albums/:album_id', type: :request do
  let(:artist) { create(:artist, name: 'Green Day') }
  let(:album) { create(:album, name: 'name', released_at: 1.year.ago, artist_id: artist.id) }
  subject { put artist_album_path(artist.id, album.id), params: params, as: :json }

  let(:name)                    { 'other_name' }
  let(:released_at)             { '2012/12/12' }

  let(:params) do
    {
      album: {
        name: name,
        released_at: released_at
      }
    }
  end

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'returns the updated album' do
    subject

    expect(json[:album][:id]).to eq(album.id)
    expect(json[:album][:name]).to eq(name)
  end
end
