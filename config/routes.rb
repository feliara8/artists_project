# frozen_string_literal: true

Rails.application.routes.draw do
  # for checking api status
  get :status, to: 'status#status'

  resources :artists, only: %i[create destroy update] do
    resources :albums, only: %i[create destroy update] do
      resources :songs, only: %i[create destroy update]
    end
  end
end
