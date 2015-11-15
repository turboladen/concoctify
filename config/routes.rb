Rails.application.routes.draw do
  root 'ember#index'

  namespace :api do
    resources :ingredients, except: %i[edit]
    resources :concoction_types, except: %i[edit], path: '/concoction-types'
    resources :concoctions
    resources :recipes, except: %i[edit] do
      get :influencing_recipes, on: :member, path: '/influencing-recipes'
    end
  end

  mount EmberCLI::Engine => 'ember-tests' if Rails.env.development?

  # Let ember handle all non-API routes
  constraints format: 'html' do
    match '(*url)', to: 'ember#index', via: %i[get post]
  end
end
