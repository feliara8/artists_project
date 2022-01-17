# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    name { 'some_name' }
    released_at { 10.years.ago }
  end
end
