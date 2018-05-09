Rails.application.routes.draw do
  devise_for :users

  resources :expeditions

  root to: 'expeditions#index'
end
