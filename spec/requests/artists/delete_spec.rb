# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE artists/:artist_id', type: :request do
  let(:artist) { create(:artist, name: 'Green Day') }
  subject { delete artist_path(artist.id), as: :json }

  it 'returns succesful' do
    subject
    expect(response).to have_http_status(:success)
  end
end
