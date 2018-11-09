class InventarioDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Producto.id", cond: :eq },
      nombre: { source: "Producto.nombre", cond: :like },
      codigo: { source: "Producto.codigo", cond: :like },
      # descripcion: { source: "Producto.descripcion", cond: :like },
      precio: { source: "Producto.precio", cond: :like },
      total_productos: { source: "Producto.id", cond: fil_total_productos }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        codigo: record.codigo,
        nombre: record.nombre,
        # descripcion: record.descripcion,
        precio: record.precio,
        total_productos: record.total_productos,
        dpaquetes: lospaquetes(record.id)
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    idAlmacen = options[:idAlmacen]
    Producto.select("productos.created_at,productos.id,productos.codigo,productos.nombre,productos.descripcion,productos.precio,IFNULL(totals.cantidad,0) as total_productos")
    .where(deleted: nil)
    .joins("LEFT JOIN totals ON totals.producto_id = productos.id AND totals.almacen_id = #{idAlmacen}")
    .order('created_at DESC')
  end

  def fil_total_productos
    ->(column) { 
      Arel.sql("totals.cantidad LIKE '%#{column}%'") 
    }
  end

  def lospaquetes(idPropucto)
    (Paquete.where(deleted: nil,producto_id: idPropucto).map {|p| {nombre: p.nombre,cantidad: p.cantidad_real}} ).to_json.html_safe
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
