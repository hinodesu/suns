Rails.application.routes.draw do

    get 'home/top'

    post'/users_search', to: 'users#search'
    post'/', to: 'user#search'

    resources :submissions
    resources :annual_events
    resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
