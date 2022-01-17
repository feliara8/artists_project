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
end
