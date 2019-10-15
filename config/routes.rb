Rails.application.routes.draw do
    # get 'home/top'
    get '/',to: 'home#top'
    get '/login',to: 'home#login'
    post '/check', to: 'home#check'
  

    post '/submissions_search', to: 'submissions#search'
    post '/', to: 'submissions#search'

    resources :submissions
    resources :annual_events
    resources :users
    resources :notifications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
