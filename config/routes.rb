Rails.application.routes.draw do

    # get 'home/top'
    get '/',to: 'home#top'
    get '/login',to: 'home#login'
    post '/check', to: 'home#check'
  
  get 'home/login'

<<<<<<< HEAD
=======
    get 'home/top'
    #get'/', to: 'home#top'
    
>>>>>>> 6c856ac094a55d1801a7cb0a1c10d19d59e67381
    post'/users_search', to: 'users#search'
    post'/', to: 'user#search'
    post '/submissions_search', to: 'submissions#search'
    post '/', to: 'submissions#search'

    
    resources :submissions
    resources :annual_events
    resources :users
    resources :notifications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
