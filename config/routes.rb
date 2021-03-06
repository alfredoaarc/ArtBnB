Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :artworks, only: [:index, :show, :new, :create] do
    resources :rentals, only: [:new, :create]
  end
  get "requests", to: "pages#requests"
  get "my-artworks", to: "pages#my_artworks"

end
