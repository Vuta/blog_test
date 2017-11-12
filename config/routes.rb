Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, except: [:edit, :update, :destroy] do
    resources :comments, only: :create
  end

  namespace :api do
    resources :posts, only: [:show, :index]
  end

  root "posts#index"
end
