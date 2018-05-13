Rails.application.routes.draw do
  devise_for :users

  resources :expeditions
  resources :regions
  resources :teleshows
  resources :forms, only: %i[create destroy]
  root to: 'expeditions#index'
end
