# frozen_string_literal: true

require 'rails_helper'

describe 'PUT artists/:artist_id', type: :request do
  let(:artist) { create(:artist, name: 'Green Day') }
  subject { put artist_path(artist.id), params: params, as: :json }

  let(:name) { 'other_name' }

  let(:params) do
    {
      artist: {
        name: name
      }
    }
  end

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'returns the updated artist' do
    subject

    expect(json[:artist][:id]).to eq(artist.id)
    expect(json[:artist][:name]).to eq(name)
  end

  context 'bulk operations' do
    let(:album_attributes) do
      [{
        name: 'dookie',
        released_at: '1999-12-12'
      }]
    end

    let(:params) do
      {
        artist: {
          name: name,
          albums_attributes: album_attributes
        }
      }
    end

    it 'add albums along with the artist update' do
      expect { subject }.to change(Album, :count).by(1)
    end

    context 'removing albums' do
      let!(:album) { create(:album, name: 'name', released_at: 1.year.ago, artist_id: artist.id) }
      let(:album_attributes) do
        [{
          id: album.id,
          _destroy: 'true'
        }]
      end

      it 'removes the album along with the artist update' do
        subject
        expect(Album.count).to eq(0)
      end
    end
  end
end
