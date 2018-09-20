Rails.application.routes.draw do
  resources :values
  resources :visions
  devise_for :users
  root 'pages#index'
  resources :missions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
