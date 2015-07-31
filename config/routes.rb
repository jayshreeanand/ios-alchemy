Rails.application.routes.draw do
  devise_for :users
  root 'pages#landing'

  resources :uploads do
    collection do
      post :create
    end
  end

end
