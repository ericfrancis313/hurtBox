Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :games, only: [:index,:show]
  resources :characters, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        resources :characters, only: [:show]
      end
    end
  end
end
