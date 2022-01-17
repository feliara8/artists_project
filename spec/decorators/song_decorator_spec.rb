# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SongDecorator do
  let(:artist) { create(:artist, name: 'Green Day') }
  let(:album) { create(:album, name: 'name', released_at: 1.year.ago, artist_id: artist.id) }
  let(:song) { create(:song, name: 'basket case', duration: 60, track_number: 1, album_id: album.id) }

  it 'converts duration to mm:ss format' do
    expect(song.decorate.duration).to eq('01:00')
  end
end
