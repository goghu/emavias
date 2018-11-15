  Rails.application.routes.draw do
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
  devise_for :users, path: 'usuarios', controllers: { sessions: 'users/sessions' }
  # devise_for :users, path: 'usuarios', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users
  # resources :cotizaciones
  get 'welcome/index'

  root :to => "users#index"
  # root :to => 'panelcontrols#index'

  # devise_scope :user do
  #   get '/usuarios/sign_in', to: 'users/sessions#new', as: 'new_user_session'
  # end
  get '/compra/mis_compras/:usuario', to: 'compras#mis_compras', as: 'mis_compras'


  # devise_for :users, path: 'auth', path_names: {  sign_out: 'logout', sign_up: 'cmon_let_me_in' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
