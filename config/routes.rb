Rails.application.routes.draw do
  devise_for :users
  root 'pages#landing'
  get 'home' => 'home#index'

  resources :uploads do
    collection do
      post :create
    end
  end

end
