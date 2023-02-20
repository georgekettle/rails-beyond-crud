Rails.application.routes.draw do
  # resources :restaurants, only: [:index, :show]
  resources :restaurants do
    # GET /restaurants/:restaurant_id/reviews/new => reviews#new
    resources :reviews, only:[ :new, :create ]
    collection do
      # GET /restaurants/top => restaurants#top
      get :top
    end
    member do
      get :chef
    end
  end

  resources :reviews, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
