# frozen_string_literal: true

require 'rails_helper'

describe Album do
  let(:artist) { create(:artist, name: 'Green Day') }

  it 'is not valid without a name' do
    album = Album.new(name: nil, artist: artist)
    expect(album).to_not be_valid
  end

  it 'is not valid without released_date' do
    album = Album.new(name: 'some_name', released_at: nil, artist: artist)
    expect(album).to_not be_valid
  end

  it 'is not valid without artist' do
    album = Album.new(name: 'some_name', released_at: '2020/12/12', artist: nil)
    expect(album).to_not be_valid
  end

  it 'is valid with name and released_at' do
    album = Album.new(name: 'some_name', released_at: '2020/12/12', artist: artist)
    expect(album).to be_valid
  end
end
