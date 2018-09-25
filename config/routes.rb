Rails.application.routes.draw do
  
  root 'pages#index'
  get '/mision-vision', to: "pages#mision_vision"
  get '/valores', to: "pages#valores"
  get '/organigrama', to: "pages#organigrama"
  get '/macroproceso', to: "pages#macroproceso"
  get '/cadena-valor', to: "pages#cadena"


  devise_for :users
  resources :missions, :visions, :values, :areas, :activities
  get '/nueva-actividad/:area_id', to: "activities#new_actividad", as: 'actividad'
  get '/editar-actividad/:id/:area_id', to: 'activities#edit_actividad', as: 'actividad_edit'



end
