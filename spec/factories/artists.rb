# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    name { 'Green Day' }
    biography { 'Punk rock band from USA' }
    born_at { '2022-01-16' }
  end
end
