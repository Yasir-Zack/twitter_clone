# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tweets
  root 'tweets#index'
end
