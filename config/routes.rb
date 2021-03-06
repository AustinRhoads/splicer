Rails.application.routes.draw do
root 'welcome#home'

 get '/signup' => 'users#new'
 post '/signup' => 'users#create'


  get '/auth/google_oauth2/callback' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'


  get "/login" => "sessions#new", :as => :login
  post '/login' => "sessions#create"
  
  get "/logout" => "sessions#destroy", :as => :logout
  get "/auth/failure" => "sessions#failure"

  
  get '/battles/:id/destroy' => 'battles#destroy'
 # resources :identities
  resources :monsters, only: [:index, :show, :new, :create, :destroy]


  get '/monsters/:id/destroy' => 'monsters#destroy' 
resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  resources :battle_parties, only: [:new, :create, :edit, :update]
  resources :battles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
 
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
