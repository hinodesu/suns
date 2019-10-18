Rails.application.routes.draw do

  get 'home/login'

    get 'home/top'
    #get'/', to: 'home#top'
    
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
