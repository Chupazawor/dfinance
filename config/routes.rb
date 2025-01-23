Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'users/home'
  resources :expenses, except: :show
end
