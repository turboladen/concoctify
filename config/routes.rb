Rails.application.routes.draw do
  namespace :api do
    resources :ingredients, except: %i[edit]
    resources :concoction_types, except: %i[edit], path: '/concoction-types'
    resources :concoctions
    resources :recipes, except: %i[edit] do
      get :influencing_recipes, on: :member, path: '/influencing-recipes'
    end
  end
end
