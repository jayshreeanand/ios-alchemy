Rails.application.routes.draw do
  devise_for :users
  require "resque_web"

  IosAlchemy::Application.routes.draw do
    mount ResqueWeb::Engine => "/resque"
  end

  root 'pages#landing'
  get 'home' => 'home#index'
  get 'designs' => 'designs#index'

  resources :uploads do
    collection do
      post :create
    end
  end

end
