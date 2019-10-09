Rails.application.routes.draw do
  get 'home/top'

  resources :annual_events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
