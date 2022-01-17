# frozen_string_literal: true

class SongDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def featured_image_url
    rails_blob_path(object.featured_image, only_path: true)
  end

  def duration
    Time.at(object.duration).strftime('%M:%S')
  end
end
