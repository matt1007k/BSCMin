Rails.application.routes.draw do
  
  root 'pages#index'
  get '/mision-vision', to: "pages#mision_vision"
  get '/valores', to: "pages#valores"
  get '/organigrama', to: "pages#organigrama"
  get '/macroproceso', to: "pages#macroproceso"
  get '/cadena-valor', to: "pages#cadena"
  get '/fuerzas-porter', to: "pages#fuerzas"
  get '/factores-internos', to: "pages#factor_interno"


  devise_for :users
  resources :missions, :visions, :values, :areas, :activities, :forces, :factors
  get '/nueva-actividad/:area_id', to: "activities#new_actividad", as: 'actividad'
  get '/editar-actividad/:id/:area_id', to: 'activities#edit_actividad', as: 'actividad_edit'
  get '/nuevo-factor/:force_id', to: "factors#new_factor", as: 'factor_new'
  get '/editar-factor/:id/:force_id', to: 'factors#edit_factor', as: 'factor_edit'


end
