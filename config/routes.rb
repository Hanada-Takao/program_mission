Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resource :relationships, only: [:create, :destroy]
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

end
