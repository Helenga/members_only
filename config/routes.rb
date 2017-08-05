Rails.application.routes.draw do
  
  root 'rumors#index'
  
  resources :users
  
  resources :rumors, only: [:new, :create, :index]
  
  get 'login' => 'session#new'
  
  post 'login' => 'session#create'
  
  delete 'logout' => 'session#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
