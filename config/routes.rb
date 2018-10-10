Rails.application.routes.draw do
  
  root 'pages#index'
  get '/mision-vision', to: "pages#mision_vision"
  get '/valores', to: "pages#valores"
  get '/organigrama', to: "pages#organigrama"
  get '/macroproceso', to: "pages#macroproceso"
  get '/cadena-valor', to: "pages#cadena"
  get '/fuerzas-porter', to: "pages#fuerzas"
  get '/factores-internos', to: "pages#factor_interno"
  get '/factores-externos', to: "pages#factor_externo"
  get '/matriz-foda', to: "pages#matriz_foda"


  devise_for :users
  resources :missions, :visions, :values, :areas, :activities, :forces, :factors
  get '/nueva-actividad/:area_id', to: "activities#new_actividad", as: 'actividad'
  get '/editar-actividad/:id/:area_id', to: 'activities#edit_actividad', as: 'actividad_edit'
  get '/nuevo-factor/:force_id', to: "factors#new_factor", as: 'factor_new'
  get '/editar-factor/:id/:force_id', to: 'factors#edit_factor', as: 'factor_edit'

  get '/evaluar-factor-interno', to: "evaluations#evaluar_factor_interno", as: 'evaluar_factor_interno'
  get '/edit-factor-interno/:id', to: "evaluations#edit_factor_interno", as: 'edit_factor_interno'
  put '/update-factor-interno/:id', to: 'activities#update_factor_interno', as: 'update_factor_interno'
  get '/evaluar-factor-externo', to: "evaluations#evaluar_factor_externo", as: 'evaluar_factor_externo'
  get '/edit-factor-externo/:id', to: "evaluations#edit_factor_externo", as: 'edit_factor_externo'
  put '/update-factor-externo/:id', to: 'factors#update_factor_externo', as: 'update_factor_externo'

end
