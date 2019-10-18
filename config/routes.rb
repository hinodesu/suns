Rails.application.routes.draw do
  get 'home/login'

    get 'home/top'
    #get'/', to: 'home#top'
    
    resources :submissions
    resources :annual_events
    resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
