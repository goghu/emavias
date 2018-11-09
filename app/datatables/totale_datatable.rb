class TotaleDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      almacen_nombre: { source: "Almacene.nombre", cond: :like },
      producto_codigo: { source: "Producto.codigo", cond: :like },
      producto_nombre: { source: "Producto.nombre", cond: :like },
      cantidad: { source: "Total.cantidad", cond: :like },
      producto_cantidad_min: { source: "Producto.nombre", cond: :like },
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        almacen_nombre: record.almacene.nombre,
        producto_codigo: record.producto.codigo,
        producto_nombre: record.producto.nombre,
        cantidad: record.cantidad,
        producto_cantidad_min: record.producto.cantidad_min
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    idAlmacen = options[:almacen_id]
    if idAlmacen
      @prod=Total.where('totals.cantidad <= productos.cantidad_min AND totals.almacen_id = ?',idAlmacen)
      .joins(:producto)
      .joins(:almacene)
    else
      @prod=Total.where('totals.cantidad <= productos.cantidad_min')
      .joins(:producto)
      .joins(:almacene)
    end
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
