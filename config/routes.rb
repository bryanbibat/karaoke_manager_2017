Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :events
    resources :participants
    resources :entries
    resources :songs
    resources :artists

    root to: "users#index"
  end

  root to: 'visitors#index'
  devise_for :users
end
