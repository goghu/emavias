Rails.application.routes.draw do
  resources :derivaciones
  resources :items
  resources :ruta
  resources :documentos
  resources :compras
  resources :caminos
  resources :gestiones
  resources :unidades
  resources :cargos
  # devise_for :users

  # get '/users/sign_in', to: 'users/sessions#new', as: 'new_user_session'
  # post '/users/sign_in', to: 'users/sessions#create', as: 'user_session'
  devise_for :users, path: "usuarios", controllers: {sessions: "users/sessions"}
  # devise_for :users, path: 'usuarios', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users
  # resources :cotizaciones
  get "welcome/index"

  root :to => "users#index"
  # root :to => 'panelcontrols#index'

  # devise_scope :user do
  #   get '/usuarios/sign_in', to: 'users/sessions#new', as: 'new_user_session'
  # end
  get "/compra/mis_compras/:usuario", to: "compras#mis_compras", as: "mis_compras"
  get "/cargo/excel", to: "cargos#excel", as: "cargos_excel"
  get "/rutas/ver_caminos/:id_ruta", to: "ruta#ver_caminos", as: "ruta_ver_caminos"
  post "/rutas/guarda_camino", to: "ruta#guarda_camino", as: "ruta_guarda_camino"
  post "/rutas/crear", to: "ruta#crear", as: "ruta_crear"
  get "/user/inicio", to: "users#inicio", as: "users_inicio"
  get "/compra/mis_tramites", to: "compras#mis_tramites", as: "compras_mis_tramites"
  get "/compra/imprime_solicitud/:id", to: "compras#imprime_solicitud", as: "compras_imprime_solicitud"

  # devise_for :users, path: 'auth', path_names: {  sign_out: 'logout', sign_up: 'cmon_let_me_in' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
