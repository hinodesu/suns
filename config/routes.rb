Rails.application.routes.draw do

    # get 'home/top'
    get '/',to: 'home#top'
    get '/login',to: 'home#login'
    post '/check', to: 'home#check'
  
  get 'home/login'
  get 'home/logout'

    get 'home/top'
    #get'/', to: 'home#top'
    
    post'/users_search', to: 'users#search'
    post'/', to: 'user#search'
    post '/submissions_search', to: 'submissions#search'
    post '/', to: 'submissions#search'
    post'/users_select_edit', to: 'users#select_edit'
    post'/submissions_select_edit', to: 'submissions#select_edit'
    post'/users_select_edit_all', to: 'users#select_edit_all'
    post'/submissions_select_edit_all', to: 'submissions#select_edit_all'
    post'/new_users_all', to: 'users#new_users_all'
    get '/new_users', to: 'users#new_users'



    resources :submissions
    resources :annual_events
    resources :users
    resources :notifications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
