Rails.application.routes.draw do
  root to: "users#index"

  resources :users, only: [:index, :show]

  get '/users', to: redirect("/users/sign_up")
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :user, only: [:show]

  resources :weights, only: [:index, :new, :create, :edit, :update]

  resources :trainings, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
    end
  end
  
  resources :meals, only: [:index, :new, :create, :edit, :update] do
    collection do
      get 'search'
    end
  end

end
