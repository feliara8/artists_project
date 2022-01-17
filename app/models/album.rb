# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates_presence_of :name, :released_at
end
