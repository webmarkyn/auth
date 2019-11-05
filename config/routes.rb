Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index, :show]
  post 'signin', to: 'sessions#create'
  get 'signin', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy'
  resources :users

  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
