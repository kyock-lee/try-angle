Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :weights, only: [:index, :new, :create]
  resources :meals, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end


end
