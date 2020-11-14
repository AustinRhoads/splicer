Rails.application.routes.draw do
  get 'battle_parties/new'
  get 'battle_parties/create'
  get 'battle_parties/show'
  get 'battle_parties/edit'
  get 'battle_parties/update'
  get 'battle_parties/destroy'
  resources :battles
root 'welcome#home'

 get '/signup' => 'users#new'
 post '/signup' => 'users#create'
# 
# get '/signin', to: 'sessions#new' 
# post '/signin', to: 'sessions#create' 


  get '/auth/google_oauth2/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  post "/auth/:provider/callback" => "sessions#create"

  get "/login" => "sessions#new", :as => :login
  post '/login' => "sessions#create"
  
  get "/logout" => "sessions#destroy", :as => :logout
  get "/auth/failure" => "sessions#failure"


  resources :identities
resources :monsters, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get '/monsters/:id/destroy' => 'monsters#destroy' 
resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
