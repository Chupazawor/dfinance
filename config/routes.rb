# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'expenses#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'users/home'
  resources :expenses, except: :show
  resources :categories, except: :show
end
