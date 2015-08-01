Rails.application.routes.draw do
  devise_for :users
  require "resque_web"

  IosAlchemy::Application.routes.draw do
    mount ResqueWeb::Engine => "/resque_web"
  end

  root 'pages#landing'
  get 'home' => 'home#index'

  resources :uploads do
    collection do
      post :create
    end
  end

end
