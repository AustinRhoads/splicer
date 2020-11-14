Rails.application.routes.draw do
root 'welcome#home'

 get '/signup' => 'users#new'
 post '/signup' => 'users#create'


  get '/auth/google_oauth2/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  post "/auth/:provider/callback" => "sessions#create"

  get "/login" => "sessions#new", :as => :login
  post '/login' => "sessions#create"
  
  get "/logout" => "sessions#destroy", :as => :logout
  get "/auth/failure" => "sessions#failure"

  resources :battles
  
  resources :identities
  resources :monsters, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get '/monsters/:id/destroy' => 'monsters#destroy' 
resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  resources :battle_parties
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
