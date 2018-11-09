  Rails.application.routes.draw do
  resources :notas_entregas
  resources :trabajos
  resources :combinaciones
  resources :pedidos
  resources :facturas
  resources :parametros
  resources :cajas
  resources :rangos_precios
  resources :categoria
  # devise_for :users

  # get '/users/sign_in', to: 'users/sessions#new', as: 'new_user_session'
  # post '/users/sign_in', to: 'users/sessions#create', as: 'user_session'
  devise_for :users, path: 'usuarios', controllers: { sessions: 'users/sessions' }
  # devise_for :users, path: 'usuarios', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users
  resources :almacenes
  resources :paquetes
  resources :productos
  resources :clientes
  resources :panelcontrols
  
  # resources :cotizaciones
  get 'welcome/index'

  root :to => "users#index"
  # root :to => 'panelcontrols#index'

  # devise_scope :user do
  #   get '/usuarios/sign_in', to: 'users/sessions#new', as: 'new_user_session'
  # end

  # devise_for :users, path: 'auth', path_names: {  sign_out: 'logout', sign_up: 'cmon_let_me_in' }

  get '/paquetes/(:swpack)/new', to: 'paquetes#new', as: 'new_paquetep'
  get '/almacenes_productos/(:id)', to: 'almacenes#productos', as: 'almacenes_productos'
  get '/ingreso/:alamacen_id/(:id)', to: 'almacenes#ingreso', as: 'ingreso'
  post '/guarda_ingreso/(:id)', to: 'almacenes#guarda_ingreso', as: 'guarda_ingreso'
  get '/salida/:alamacen_id/(:id)', to: 'almacenes#salida', as: 'salida'
  post '/guarda_salida/(:id)', to: 'almacenes#guarda_salida', as: 'guarda_salida'
  get '/movimientos/:alamacen_id/(:id)', to: 'almacenes#movimientos', as: 'movimientos'
  delete '/movimientos/:id', to: 'almacenes#eliminar_mov', as: 'eliminar_mov'

  get '/transferencia/:alamacen_id/(:id)', to: 'almacenes#transferencia', as: 'transferencia'
  post '/guarda_transferencia', to: 'almacenes#guarda_transferencia', as: 'guarda_transferencia'


  get '/cotizaciones/:idalmacen', to: 'cotizaciones#index', as: 'cotizaciones'
  get '/cotizaciones_cliente', to: 'cotizaciones#cotizaciones_cliente', as: 'cotizaciones_cliente'
  get '/nueva_contizacion/:idalmacen/(:idcliente)', to: 'cotizaciones#new', as: 'new_cotizacione'
  get '/nueva_contizacion_cliente', to: 'cotizaciones#nueva_contizacion_cliente', as: 'nueva_contizacion_cliente'
  get '/edicion_cotiazion/:idalmacen/:idcliente/:numero', to: 'cotizaciones#edit', as: 'edit_cotizacione'
  get '/edicion_cotiazion_cliente/:numero', to: 'cotizaciones#edicion_cotiazion_cliente', as: 'edicion_cotiazion_cliente'
  get '/impresion_cotizacion/:idalmacen/:idcliente/:numero', to: 'cotizaciones#impresion', as: 'impresion_cotizacion'
  post '/crea_contizacion', to: 'cotizaciones#create', as: 'crea_cotizacion'
  post '/crea_cotizacion_cliente', to: 'cotizaciones#crea_cotizacion_cliente', as: 'crea_cotizacion_cliente'
  patch '/actualiza_contizacion', to: 'cotizaciones#update', as: 'actualiza_contizacion'
  delete '/cotizaciones/:idalmacen/:idcliente/:numero', to: 'cotizaciones#destroy'

  get '/administrar_almacen/:idalmacen', to: 'almacenes#administrar_almacen', as: 'administrar_almacen'
  get '/administracion/:idalmacen', to: 'almacenes#administracion', as: 'administracion'

  get '/nueva_venta/:idalmacen/:idcliente/:numero', to: 'ventas#new', as: 'new_venta'
  get '/ventas/:idalmacen', to: 'ventas#index', as: 'ventas'
  post '/crea_venta', to: 'ventas#create', as: 'crea_venta'
  get '/edit_venta/:idalmacen/:idcliente/:numero', to: 'ventas#edit', as: 'edit_venta'
  patch '/actualiza_venta', to: 'ventas#update', as: 'actualiza_venta'
  delete '/ventas/:idalmacen/:idcliente/:numero', to: 'ventas#destroy'
  get '/ventas/impresion/:idalmacen/:idcliente/:numero', to: 'ventas#impresion', as: 'ventas_impresion'
  
  get '/almacen/(:id)', to: 'almacenes#almacen', as: 'almacen'
  match 'guardalmacen', to: 'almacenes#guardalmacen', as: 'guardalmacen', via: [:patch, :post]
	#post '/guardalmacen', to: 'almacenes#guardalmacen', as: 'guardalmacen'
	get '/paqueete/(:id)', to: 'paquetes#paqueete', as: 'paqueete'
	match 'guardapaquete', to: 'paquetes#guardapaquete', as: 'guardapaquete', via: [:patch, :post]
	#post '/guardapaquete', to: 'paquetes#guardapaquete', as: 'guardapaquete'
	get '/ /(:id)', to: 'cotizaciones#cotizacion', as: 'cotizacion'

  get '/categorias/new', to: 'categoria#new', as: 'new_categorias'

  get '/rangos_precio/precios/(:id_producto)', to: 'rangos_precios#precios', as: 'rangos_inicio'

  get '/cantidad/(:id)', to: 'productos#cantidad', as: 'cantidad'

  get '/precio_cliente/:id_producto/:min/:max/:id_cliente', to: 'cotizaciones#precio_cliente', as: 'precio_cliente'

  post '/crea_pago', to: 'pagos#create', as: 'crea_pago'
  delete '/pagos/:idpago', to: 'pagos#destroy'

  post '/get_datos_ingresos', to: 'panelcontrols#get_datos_ingresos', as: 'get_datos_ingresos'
  post '/get_datos_topproductos', to: 'panelcontrols#get_datos_topproductos', as: 'get_datos_topproductos'
  post '/get_datos_topclientes', to: 'panelcontrols#get_datos_topclientes', as: 'get_datos_topclientes'
  get '/producto/excel', to: 'productos#excel', as: 'excel'
  get '/producto/llena_paquetes', to: 'productos#llena_paquetes', as: 'llena_paquetes'
  get '/producto/llena_precios', to: 'productos#llena_precios', as: 'llena_precios'

  get '/get_canti_panel', to: 'panelcontrols#get_canti_panel', as: 'get_canti_panel'


  get '/facturas/:numero_venta/nuevo', to: 'facturas#nuevo', as: 'nueva_factura'
  post '/guarda_factura', to: 'facturas#guarda_factura', as: 'guarda_factura'

  get '/caja/nueva_entrega/', to: 'cajas#nueva_entrega', as: 'cajas_nueva_entrega'
  get '/caja/imprimir/:id', to: 'cajas#imprimir', as: 'imprimir'
  delete '/caja/elimina_transferencia/:id', to: 'cajas#elimina_transferencia', as: 'elimina_transferencia'
  post '/caja/guarda_entrega/', to: 'cajas#guarda_entrega', as: 'cajas_guarda_entrega'
  
  match '/reportes/ventas', to: 'reportes#ventas', as: 'reportes_ventas', via: [:get, :post]
  match '/reportes/ventas_dia', to: 'reportes#ventas_dia', as: 'reportes_ventas_dia', via: [:get, :post]
  match '/reportes/productos_dia', to: 'reportes#productos_dia', as: 'reportes_productos_dia', via: [:get, :post]
  match '/reportes/pagos_dia', to: 'reportes#pagos_dia', as: 'reportes_pagos_dia', via: [:get, :post]
  match '/reportes/cajachica', to: 'reportes#cajachica', as: 'reportes_cajachica', via: [:get, :post]
  match '/reportes/hoycajachica', to: 'reportes#hoycajachica', as: 'reportes_hoycajachica', via: [:get, :post]
  match '/reportes/movimientos', to: 'reportes#movimientos', as: 'reportes_movimientos', via: [:get, :post]

  get '/producto/sube_excel', to: 'productos#sube_excel', as: 'productos_sube_excel'
  post '/producto/guarda_excel', to: 'productos#guarda_excel', as: 'productos_guarda_excel'
  
  get '/almacene/sube_excel/:almacen_id', to: 'almacenes#sube_excel', as: 'almacenes_sube_excel'
  post '/almacene/guarda_excel/:almacen_id', to: 'almacenes#guarda_excel', as: 'almacenes_guarda_excel'
  
  get '/venta/lista_cliente', to: 'ventas#lista_cliente', as: 'ventas_lista_cliente'

  match '/factura/prueba', to: 'facturas#prueba', as: 'facturas_prueba', via: [:get, :post]
  get '/combinacione/ver/(:id_producto)', to: 'combinaciones#ver', as: 've_combinaciones'
  get '/combinacione/busca_producto/(:texto)', to: 'combinaciones#busca_producto', as: 'busca_producto'
  get '/combinacione/carga_datos_productos/(:texto)', to: 'combinaciones#carga_productos', as: 'combinaciones_carga_productos'
  match '/combinacione/ajax_guarda_combinacion', to: 'combinaciones#ajax_guarda_combinacion', as: 'ajax_guarda_combinacion', via: [:get, :post]
  post '/combinacione/guarda_producto', to: 'combinaciones#guarda_producto', as: 'comb_guarda_producto'
  get '/nuevo_trabajo/:idalmacen/:idcliente/:numero', to: 'trabajos#new', as: 'new_trabajos'
  get '/nueva_nota/:idalmacen/:idcliente/:numero', to: 'notas_entregas#new', as: 'new_notas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
