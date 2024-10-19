Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    get '/search', to: 'searches#search', as: 'search'
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :destroy]
    resources :post_comments, only: [:index, :destroy]
    resources :situations, only: [:new, :index, :create, :update, :destroy]
    resources :relationships, only: [:new, :index, :create, :update, :destroy]
  end
  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'mypage' => 'users#mypage'
    get '/search', to: 'searches#search'
    resources :users
    resources :posts do
      resources :post_comments, only: [:create, :update, :destroy]
      resources :likes, only: [:create, :destroy, :index]
    end
    resources :situations, only: [:create, :update, :destroy]
    resources :relationships, only: [:create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
