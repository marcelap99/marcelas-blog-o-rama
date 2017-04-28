Rails.application.routes.draw do
#  get 'sessions/new'

  get '/sessions/new' => "sessions#new"
  post '/sessions' => "sessions#create"
  delete '/sessions/:id' => "sessions#destroy"
  # /sessions/:id(.:format)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index', as: 'home'

  # get "/" => "home#index"

  # get '/users' => "users#index"


  # get '/posts' => "posts#index"
  # get '/posts/new' => "posts#new"
  # get '/posts/show' => "posts#show"
  # get '/posts/edit' => "posts#edit"


  resources :users
  # resources :posts

  resources :posts do
    resources :comments
  end



end
