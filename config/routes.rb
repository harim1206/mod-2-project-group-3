Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#show"
  get '/presignup' => 'sessions#accounttype', as: :presignup

  get '/existingsignup' => 'sessions#choosefamily', as: :choosefamily
  post '/existingsignup' => 'sessions#choosemember'

  get '/signup' => 'sessions#newaccount', as: :signup
  post '/signup' => 'sessions#createaccount'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  
  get '/logout' => 'sessions#destroy'

  resources :memories
  resources :people
  resources :families


end
