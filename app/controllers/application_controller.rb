class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
  	root_path
  end
  def after_sign_in_path_for(resource_or_scope)
  	if current_user.rol == 'Administrador'
  		root_path
  	elsif current_user.rol == 'Almacen'
  		almacenes_productos_path
    elsif current_user.rol == 'Cliente'
      users_path
  	end
  end
end
