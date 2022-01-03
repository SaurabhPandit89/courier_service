# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :home, only: :index do
    collection do
      post :track
    end
  end

  root 'home#index'

  resources :parcels
  resources :parcel_status, only: :create
end
