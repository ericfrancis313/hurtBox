Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :games, only: [:index,:show]

  namespace :api do
    namespace :v1 do
      resources :games, only:[:show]
    end 
  end
end
