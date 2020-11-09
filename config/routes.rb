Rails.application.routes.draw do
root 'welcome#home'

get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/signin', to: 'sessions#new' 
post '/signin', to: 'sessions#create' 


  get '/auth/google_oauth2/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'


resources :monsters, only: [:index, :show, :new, :create, :edit, :update, :destroy]
resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
