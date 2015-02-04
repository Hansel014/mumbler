Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/new'

  get 'comments/show'

  get 'comments/edit'

    resources :users
    resources :posts

     get '/signin', to: 'sessions#new'
      post '/signin', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'

  # You can have the root of your site routed with "root"
  root 'users#index'

end
