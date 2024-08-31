Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'mypage' => 'users#mypage'
  resources :users
  resources :posts
  resources :situations, only: [:create, :update, :destroy]
  resources :relationships, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
