Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "masters#index"
  # get '/login', to: "masters#login"
  #
  # get '/familyhomepage/:id', to: "masters#familyhomepage"


  resources :memories
  resources :people
  resources :families


end
