Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#show"
  get '/signup' => 'people#new', as: :signup
  post '/people' => 'people#create'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :memories
  resources :people
  resources :families


end
