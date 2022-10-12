# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registration: 'registration' }
  resources :tweets
  root 'tweets#index'
end
