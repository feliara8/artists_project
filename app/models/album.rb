# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, inverse_of: :album

  validates_presence_of :name, :released_at

  accepts_nested_attributes_for :songs, allow_destroy: true
end
