Rails.application.routes.draw do


  get 'monsters/index'
  get 'monsters/show'
  get 'monsters/new'
  get 'monsters/create'
  get 'monsters/show'
  get 'monsters/destroy'
resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
