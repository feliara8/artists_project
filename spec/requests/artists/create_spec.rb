# frozen_string_literal: true

require 'rails_helper'

describe 'POST artists/', type: :request do
  let(:artist) { Artist.last }
  subject { post artists_path, params: params, as: :json }

  let(:name) { 'name' }
  let(:born_at) { '2012/12/12' }

  let(:params) do
    {
      artist: {
        name: name,
        born_at: born_at
      }
    }
  end

  it 'returns a successful response' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'creates the artist' do
    expect { subject }.to change(Artist, :count).by(1)
  end

  it 'returns the created Artist' do
    subject

    expect(json[:artist][:id]).to eq(artist.id)
    expect(json[:artist][:name]).to eq(artist.name)
  end

  context 'without name' do
    let(:name) { '' }

    it 'does return bad request' do
      subject
      expect(response.status).to eq(400)
    end
  end
end
