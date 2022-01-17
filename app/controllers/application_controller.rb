# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def invalid_record(exception)
    render json: { errors: exception.record.errors.as_json }, status: :bad_request
  end

  def record_not_found(_exception)
    render json: { error: 'record not found' }, status: :not_found
  end
end
