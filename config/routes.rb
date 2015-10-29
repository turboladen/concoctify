Rails.application.routes.draw do
  root 'ember#index'

  resources :ingredients, except: %i[edit]
  resources :concoction_types
  resources :concoctions
  resources :recipes
end
