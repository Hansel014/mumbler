Rails.application.routes.draw do

    resources :users do 
    	get :following, :followers
    end
    resources :posts do 
      resources :comments
    end
    # resources :relationships, only: [:create, :destroy]

    get '/follow/:id', to: 'relationships#create', as: 'follow'
    get '/unfollow/:id', to: 'relationships#destroy', as: 'unfollow'

     get '/signin', to: 'sessions#new'
     post '/signin', to: 'sessions#create'
     delete '/logout', to: 'sessions#destroy'


  # You can have the root of your site routed with "root"
  root 'users#index'

end
