Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'new', to: 'games#new'
  # add 'as: :score' to add a prefix to a route if it's missing
  post 'score', to: 'games#score'
end
