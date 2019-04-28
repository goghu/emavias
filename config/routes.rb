Rails.application.routes.draw do
  resources :escogidos
  resources :memos
  get 'reportes/tramites'

  get 'reportes/fechas'

  resources :alternativos
  resources :docderivaciones
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
  get "/rutas/eliminar/:id_ruta", to: "ruta#eliminar", as: "ruta_eliminar"
  post "/rutas/guarda_camino", to: "ruta#guarda_camino", as: "ruta_guarda_camino"
  post "/rutas/crear", to: "ruta#crear", as: "ruta_crear"
  get "/rutas/muestra_funcionarios/:id_unidad", to: "ruta#muestra_funcionarios", as: "ruta_muestra_funcionario"
  get "/rutas/muestra_cargos/:id_unidad", to: "ruta#muestra_cargos", as: "ruta_muestra_cargos"
  get "/rutas/editar/:id_ruta", to: "ruta#editar", as: "ruta_editar"
  patch "/rutas/guarda_editado", to: "ruta#guarda_editado", as: "ruta_guarda_editado"

  get "/user/inicio", to: "users#inicio", as: "users_inicio"
  
  get "/compra/mis_tramites", to: "compras#mis_tramites", as: "compras_mis_tramites"
  get "/compra/imprime_solicitud/:id_compra", to: "compras#imprime_solicitud", as: "compras_imprime_solicitud"
  get "/compra/edita_compra/:id_compra", to: "compras#edita_compra", as: "compras_edita_compra"
  get "/compra/asignar/:id_compra", to: "compras#asignar", as: "compras_asignar"
  post "/compra/completa_solicitud", to: "compras#completa_solicitud", as: "compras_completa_solicitud"
  get "/compra/bandeja_entrada", to: "compras#bandeja_entrada", as: "compras_bandeja_entrada"
  get "/compra/carga_excepcion", to: "compras#carga_excepcion", as: "compras_carga_excepcion"
  get "/compra/ver_documento/:id_compra", to: "compras#ver_documento", as: "compras_ver_documento"
  get "/compra/ver_adjunto/:id_compra", to: "compras#ver_adjunto", as: "compras_ver_adjunto"

  get "/derivacione/ver_documento/:id_derivacion", to: "derivaciones#ver_documento", as: "derivaciones_ver_documento"
  get "/derivacione/ver_documento_rpa/:id_derivacion", to: "derivaciones#ver_documento_rpa", as: "derivaciones_ver_documento_rpa"
  post "/derivacione/guarda_derivacion", to: "derivaciones#guarda_derivacion", as: "derivaciones_guarda_derivacion"
  get "/derivacione/ver_derivaciones/:id_compra", to: "derivaciones#ver_derivaciones", as: "derivaciones_ver_derivaciones"
  get "/derivacione/ver_documento_jefe/:id_derivacion", to: "derivaciones#ver_documento_jefe", as: "derivaciones_ver_documento_jefe"
  get "/derivacione/ver_memo", to: "derivaciones#ver_memo", as: "derivaciones_ver_memo"
  
  get "/camino/eliminar/:id_camino/:cod_ruta", to: "caminos#eliminar", as: "camino_eliminar"
  get "/camino/carga_funcionario/:proceso", to: "caminos#carga_funcionario", as: "camino_carga_funcionario"
  get "/camino/carga_funcionario_alternativo/:id_alternativo/:id_compra", to: "caminos#carga_funcionario_alternativo", as: "camino_carga_funcionario_alternativo"

  get "/documento/nuevo/:id_camino", to: "documentos#nuevo", as: "documento_nuevo"
  post "/documento/guarda_nuevo", to: "documentos#guarda_nuevo", as: "documento_guarda_nuevo"
  get "/documento/eliminar/:id_documento/:id_camino", to: "documentos#eliminar", as: "documento_eliminar"
  get "/documento/memos/:id_camino", to: "documentos#memos", as: "documento_memos"
  post "/documento/guarda_memo", to: "documentos#guarda_memo", as: "documento_gurada_memo"
  get "/documento/elimina_memo/:id_memo/:id_camino", to: "documentos#elimina_memo", as: "documento_elimina_memo"

  get "/alternativo/nuevo/:id_camino", to: "alternativos#nuevo", as: "alternativos_nuevo"
  post "/alternativo/guarda_nuevo", to: "alternativos#guarda_nuevo", as: "alternativos_guarda_nuevo"
  get "/alternativo/eliminar/:id_alternativo/:id_camino", to: "alternativos#eliminar", as: "alternativos_eliminar"
  # get "/alternativo/muestra_alternativos/:id_camino", to: "alternativos#nuevo", as: "alternativos_nuevo"

  get "/reportes/tramites", to: "reportes#tramites", as: "reporte_tramites"
  post "/reportes/por_numero", to: "reportes#por_numero", as: "reporte_por_numero"
  post "/reportes/por_usuario", to: "reportes#por_usuario", as: "reporte_por_usuario"
  post "/reportes/por_fecha", to: "reportes#por_fecha", as: "reporte_por_fecha"
  post "/reportes/por_unidad", to: "reportes#por_unidad", as: "reporte_por_unidad"

  # devise_for :users, path: 'auth', path_names: {  sign_out: 'logout', sign_up: 'cmon_let_me_in' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
