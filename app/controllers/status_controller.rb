# frozen_string_literal: true

class StatusController < ApplicationController
  def status
    render json: { online: true }
  end
end
