Rails.application.routes.draw do
  devise_for :users
  require "resque_web"

  IosAlchemy::Application.routes.draw do
    mount ResqueWeb::Engine => "/resque"
  end

  root 'pages#landing'
  get 'home' => 'uploads#home'
  get 'designs' => 'designs#index'

  resources :uploads do
    collection do
      post :create
    end
  end

  resources :designs do
    collection do
      post :create
    end
  end

end
