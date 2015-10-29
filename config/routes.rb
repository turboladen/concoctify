Rails.application.routes.draw do
  root 'ember#index'

  resources :ingredients, except: %i[edit]
  resources :concoction_types, except: %i[edit]
  resources :concoctions
  resources :recipes, except: %i[edit]

  mount EmberCLI::Engine => 'ember-tests' if Rails.env.development?
end
