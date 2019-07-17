Rails.application.routes.draw do
  resources :shoes
  resources :profiles
  devise_for :users
  
  root 'shoes#index'
  
  post '/payment', to:"buyer#payment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
