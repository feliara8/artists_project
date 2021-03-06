# frozen_string_literal: true

class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates_presence_of :name

  accepts_nested_attributes_for :albums, allow_destroy: true
end
