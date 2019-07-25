Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :games, only: [:index, :show, :new, :create]
  resources :characters, only: [:index, :show]
  resources :vocabularies, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        resources :characters, only: [:show] do
          resources :moves , only: [:show]
        end
      end
      resources :vocabularies, only: [:show]
    end
  end
end
