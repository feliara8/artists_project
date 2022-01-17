# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE artists/:artist_id/albums/:album_id', type: :request do
  let(:artist) { create(:artist, name: 'Green Day') }
  let(:album) { create(:album, name: 'name', released_at: 1.year.ago, artist_id: artist.id) }
  subject { delete artist_album_path(artist.id, album.id), as: :json }

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end
end
