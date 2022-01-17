# frozen_string_literal: true

require 'rails_helper'

describe 'POST artists/:artist_id/albums/', type: :request do
  let(:artist) { create(:artist, name: 'Green Day') }
  let(:album) { Album.last }
  subject { post artist_albums_path(artist.id), params: params, as: :json }

  let(:name)                    { 'name' }
  let(:released_at)             { '2012/12/12' }

  let(:params) do
    {
      album: {
        name: name,
        released_at: released_at,
        artist_id: artist.id
      }
    }
  end

  it 'returns a successful response' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'creates the album' do
    expect { subject }.to change(Album, :count).by(1)
  end

  it 'returns the created album' do
    subject

    expect(json[:album][:id]).to eq(album.id)
    expect(json[:album][:name]).to eq(album.name)
  end

  context 'without name' do
    let(:name) { '' }

    it 'does return bad request' do
      subject
      expect(response.status).to eq(400)
    end
  end

  context 'without released_at' do
    let(:released_at) { '' }

    it 'does return bad request' do
      subject
      expect(response.status).to eq(400)
    end
  end
end
