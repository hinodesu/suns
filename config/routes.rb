Rails.application.routes.draw do

    get 'home/top'

<<<<<<< HEAD
    post'/users_search', to: 'users#search'
    post'/', to: 'user#search'
=======
    post '/submissions_search', to: 'submissions#search'
    post '/', to: 'submissions#search'
>>>>>>> c1ebb7533d573623beea256df1ca7bf22a28f807

    resources :submissions
    resources :annual_events
    resources :users
    resources :notifications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
