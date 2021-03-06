Rails.application.routes.draw do
  root 'vocabularies#index'
  devise_for :users

  resources :games, only: [:index, :show, :new, :create]
  resources :users, only: [:index, :show, :new, :create]
  resources :characters, only: [:index, :show, :new, :create]
  resources :vocabularies, only: [:index, :show, :new, :create]
  resources :vocabtest, only: [:index]


  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        resources :characters, only: [:show] do
          resources :moves , only: [:show]
        end
      end
      resources :vocabularies, only: [:show, :index]
    end
  end
end
