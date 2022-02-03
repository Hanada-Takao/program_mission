Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'blogs', to: 'blogs#index'
  get 'blogs/new', to: 'blogs#new'
end
