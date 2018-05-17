Rails.application.routes.draw do
  devise_for :users

  # users routes
  resources :users, only: :update
  get 'users/edit/:id', to: 'users#edit', as: :update_profile
  get 'users/:id', to: 'users#show', as: :user_path
  get 'users', to: 'users#index', as: :users_path

  resources :expeditions
  resources :regions
  resources :teleshows
  resources :forms, only: %i[create destroy]
  root to: 'expeditions#index'
end
