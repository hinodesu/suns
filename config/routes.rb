Rails.application.routes.draw do
<<<<<<< HEAD
  get 'home/login'

    get 'home/top'
    #get'/', to: 'home#top'
    
=======

    get 'home/top'

<<<<<<< HEAD
    post'/users_search', to: 'users#search'
    post'/', to: 'user#search'
=======
    post '/submissions_search', to: 'submissions#search'
    post '/', to: 'submissions#search'
>>>>>>> c1ebb7533d573623beea256df1ca7bf22a28f807

>>>>>>> 22235bfcdafa47206da75942fe6ad067f000e085
    resources :submissions
    resources :annual_events
    resources :users
    resources :notifications

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
