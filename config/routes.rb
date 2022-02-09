Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :blogs do
    resources :comments, only: %i[create destroy]
  end

  # root 'blogs#index'
end
