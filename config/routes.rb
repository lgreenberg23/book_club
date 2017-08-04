Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'


  # post '/wishlists/upvote/:id', to: 'wishlists#upvote', as: 'upvote'
  # post '/wishlists/downvote/:id', to: 'wishlists#downvote', as: 'downvote'
  get '/books/add_to_wishlist/:id', to: 'books#add_to_wishlist', as: "add_to_wishlist"
  get '/users/admin', to: 'users#admin', as: 'new_admin' 
  resources :users
  resources :books
  resources :groups
  # resources :wishlists
  get '/meetings/attend/:id', to: 'meetings#attend', as: 'attend_meeting'
  get '/meetings/unattend/:id', to: 'meetings#unattend', as: 'unattend_meeting'
  resources :meetings

  resources :wishlists do
    member do
      post 'upvote'
    end
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'


end
