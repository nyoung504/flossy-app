# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#page'
  get 'item/page'
  resources :listings
  resources :payments, only: [:create]
  get '/payments/success', to: 'payments#success'
  get '/payments/cancel', to: 'payments#cancel'
  
end
