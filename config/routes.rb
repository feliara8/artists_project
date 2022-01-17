# frozen_string_literal: true

Rails.application.routes.draw do
  # for checking api status
  get :status, to: 'status#status'

  resources :artists, only: %i[create destroy update show] do
    resources :albums, only: %i[create destroy update show] do
      resources :songs, only: %i[create destroy update show]
    end
  end
end
