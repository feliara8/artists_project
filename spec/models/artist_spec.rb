# frozen_string_literal: true

require 'rails_helper'

describe Artist do
  it 'is not valid without a name' do
    artist = Artist.new(name: nil)
    expect(artist).to_not be_valid
  end

  it 'is valid with name' do
    artist = Artist.new(name: 'green day')
    expect(artist).to be_valid
  end
end
