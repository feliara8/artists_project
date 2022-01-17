# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :album

  validates_presence_of :name, :track_number, :duration
  validates :track_number, :duration, numericality: { greater_than: 0 }
  validates :track_number, uniqueness: { scope: :album_id,
                                         message: 'should only exist one track number per album' }
  has_one_attached :featured_image
end
