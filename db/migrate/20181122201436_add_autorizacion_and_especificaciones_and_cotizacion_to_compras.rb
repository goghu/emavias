class AddAutorizacionAndEspecificacionesAndCotizacionToCompras < ActiveRecord::Migration[5.1]
  def change
    add_column :compras, :autorizaciones, :boolean, after: :existencia
    add_column :compras, :especificaciones, :boolean, after: :existencia
    add_column :compras, :cotizacion, :boolean, after: :existencia
  end
end
