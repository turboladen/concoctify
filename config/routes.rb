Rails.application.routes.draw do
  namespace :api do
    resources :ingredients, except: %i[edit] do
      get :concoction_types, on: :member
      get :concoctions, on: :member
      get :recipes, on: :member
    end

    resources :concoction_types, except: %i[edit] do
      get :concoctions, on: :member
      get :ingredients, on: :member
      get :recipes, on: :member
    end

    resources :concoctions, except: %i[edit] do
      get :recipe, on: :member
    end

    resources :recipes, except: %i[edit] do
      get :concoction_type, on: :member
      get :concoctions, on: :member
      get :influencing_recipes, on: :member
      get :ingredients, on: :member
    end
  end
end
