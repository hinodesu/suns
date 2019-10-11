Rails.application.routes.draw do
    get 'home/top'

    post '/submissions_search', to: 'submissions#search'
    post '/', to: 'submissions#search'

    resources :submissions
    resources :annual_events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
