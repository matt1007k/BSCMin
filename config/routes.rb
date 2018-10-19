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
  get '/mapa-estrategico', to: "pages#mapa_estrategico"


  devise_for :users
  resources :informations, :values, :areas, :activities, :forces, :factors, :expect => [:show] 
  resources :strategies
  resources :perspectives, only: [:edit, :update, :new, :create]
  resources :objectives, :expect => [:show, :new, :edit]
  resources :procesos, :expect => [:update, :show] 
  put '/procesos/:id', to: 'procesos#update', as: 'update_proceso'

  get '/subproceso/new/:proceso_id', to: 'subprocesos#new', as: 'new_subproceso'
  get '/subproceso/:proceso_id/edit/:id', to: 'subprocesos#edit', as: 'edit_subproceso'
  post '/subprocesos', to: 'subprocesos#create', as: 'create_subproceso'
  put '/subprocesos/:id', to: 'subprocesos#update', as: 'update_subproceso'
  delete '/subprocesos/:id', to: 'subprocesos#destroy', as: 'destroy_subproceso'
   
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

  get '/nuevo-objective/:perspective_id', to: "objectives#new", as: 'objective_new'
  get '/editar-objective/:id/:perspective_id', to: 'objectives#edit', as: 'objective_edit'
end
