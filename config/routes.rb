Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"
  resources :products do
    resources :orders, only: %i[create]
  end
  resources :orders, only: %i[show]
end
