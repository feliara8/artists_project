# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    name { 'some_song' }
    duration { 60 }
    genre { 'some_genre' }
    track_number { 1 }
  end
end
