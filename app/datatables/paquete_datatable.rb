class PaqueteDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Paquete.id", cond: :eq },
      producto: { source: "Producto.codigo", cond: :eq },
      paquete_nombre: { source: "Paquete.nombre", cond: :like },
      cantidad: { source: "Paquete.cantidad", cond: :eq },
      producto_nombre: { source: "Producto.nombre", cond: :like },
      pq_nombre: { source: "pq_nombre", cond: filter_pq_nombre_condition, searchable:true }
    }
  end


  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        producto: record.producto.codigo,
        paquete_nombre: record.nombre,
        cantidad: record.cantidad,
        producto_nombre: record.nombre_pro,
        pq_nombre: record.pq_nombre,
        DT_RowId:   record.id,
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    # Paquete.where(deleted: nil).order('paquetes.created_at DESC').includes(:producto).references(:producto)
    Paquete.select("paquetes.id,productos.codigo,paquetes.nombre,paquetes.producto_id,paquetes.cantidad,paquetes.paquete_id,IFNULL(productos.nombre,'--- No es producto ---') as nombre_pro,IFNULL(paqs.nombre,'--- No es paquete ---') as pq_nombre")
    .where(deleted: nil)
    .order('paquetes.created_at DESC')
    .joins("LEFT JOIN productos ON productos.id = paquetes.producto_id")
    .joins("LEFT JOIN paquetes AS paqs ON paqs.id = paquetes.paquete_id")
  end


  def filter_pq_nombre_condition
    ->(column) {
      Arel.sql("paqs.nombre LIKE '%#{column}%'")
    }
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