Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'home/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show]
  resources :blogs do
    resources :comments, only: %i[create destroy]
  end

  root 'blogs#index'
end
