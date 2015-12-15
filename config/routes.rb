Rails.application.routes.draw do
  namespace :api do
    resources :ingredients, except: %i[edit] do
      get :recipes, on: :member
      get :concoctions, on: :member
      get :concoction_types, on: :member
    end

    resources :concoction_types, except: %i[edit]
    resources :concoctions, except: %i[edit]

    resources :recipes, except: %i[edit] do
      get :influencing_recipes, on: :member
    end
  end
end
