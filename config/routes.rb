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
  get "/compra/imprime_solicitud/:id_compra", to: "compras#imprime_solicitud", as: "compras_imprime_solicitud"
  get "/compra/edita_compra/:id_compra", to: "compras#edita_compra", as: "compras_edita_compra"
  get "/compra/asignar/:id_compra", to: "compras#asignar", as: "compras_asignar"
  post "/compra/completa_solicitud", to: "compras#completa_solicitud", as: "compras_completa_solicitud"
  get "/compra/bandeja_entrada", to: "compras#bandeja_entrada", as: "compras_bandeja_entrada"
  get "/derivacione/ver_documento/:id_derivacion", to: "derivaciones#ver_documento", as: "derivaciones_ver_documento"
  post "/derivacione/guarda_derivacion", to: "derivaciones#guarda_derivacion", as: "derivaciones_guarda_derivacion"
  get "/rutas/muestra_funcionarios/:id_unidad", to: "ruta#muestra_funcionarios", as: "ruta_muestra_funcionario"
  get "/camino/eliminar/:id_camino/:cod_ruta", to: "caminos#eliminar", as: "camino_eliminar"
  get "/camino/carga_funcionario/:proceso", to: "caminos#carga_funcionario", as: "camino_carga_funcionario"

  # devise_for :users, path: 'auth', path_names: {  sign_out: 'logout', sign_up: 'cmon_let_me_in' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
