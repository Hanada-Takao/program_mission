Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#top"
  post '/home/guest_admin_sign_in', to: 'home#guest_admin_sign_in'
  post '/home/guest_sign_in', to: 'home#guest_sign_in'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resource :relationships, only: %i[create destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :blogs do
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  resources :conversations do
    resources :messages
  end
  resources :missions do
    collection do
      get 'search'
    end
  end

end
