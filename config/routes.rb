Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end
  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'mypage' => 'users#mypage'
    resources :users
    resources :posts
    resources :situations, only: [:create, :update, :destroy]
    resources :relationships, only: [:create, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
