# frozen_string_literal: true

require 'rails_helper'

describe Song do
  let(:artist) { create(:artist, name: 'Green Day') }
  let(:album) { create(:album, name: 'Dookie', artist_id: artist.id, released_at: '1999-12-12') }

  it 'is not valid without a name' do
    song = Song.new(name: nil, album_id: album.id, track_number: 1, duration: 60)
    expect(song).to_not be_valid
  end

  it 'is not valid without album' do
    song = Song.new(name: 'basket case', album_id: nil, track_number: 1, duration: 60)
    expect(song).to_not be_valid
  end

  it 'is not valid without track number' do
    song = Song.new(name: 'basket case', album_id: album.id, track_number: nil, duration: 60)
    expect(song).to_not be_valid
  end

  it 'is not valid without duration' do
    song = Song.new(name: 'basket case', album_id: album.id, track_number: 1, duration: nil)
    expect(song).to_not be_valid
  end

  it 'is not valid with negative track number' do
    song = Song.new(name: 'basket case', album_id: album.id, track_number: -1, duration: 60)
    expect(song).to_not be_valid
  end

  it 'is not valid with negative duration' do
    song = Song.new(name: 'basket case', album_id: album.id, track_number: 1, duration: -60)
    expect(song).to_not be_valid
  end

  it 'is valid with all correct params' do
    song = Song.new(name: 'basket case', album_id: album.id, track_number: 1, duration: 60)
    expect(song).to be_valid
  end

  context 'track number uniqueness' do
    let!(:song) { create(:song, name: 'Dookie2', track_number: 1, duration: 60, album_id: album.id) }
    let!(:other_album) { create(:album, name: 'Dookie2', artist_id: artist.id, released_at: '1999-12-12') }

    it 'is not valid if track number already exists' do
      song = Song.new(name: 'basket case', album_id: album.id, track_number: 1, duration: 60)
      expect(song).to_not be_valid
    end

    it 'is is valid if track number already exists but for another album of the artist' do
      song = Song.new(name: 'basket case', album_id: other_album.id, track_number: 1, duration: 60)
      expect(song).to be_valid
    end
  end
end
