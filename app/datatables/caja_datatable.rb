class CajaDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Caja.id", cond: :eq },
      tipo: { source: "Caja.tipo", cond: :like },
      fecha: { source: "Caja.fecha", cond: :like },
      descripcion: { source: "Caja.descripcion", cond: :like },
      monto: { source: "Caja.monto", cond: :like },
      nombre_usuario: { source: "nombre_usuario", cond: filter_nombre_usuario_condition, searchable:true },
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        tipo: record.tipo,
        fecha: record.fecha,
        descripcion: record.descripcion,
        monto: record.monto,
        nombre_usuario: record.nombre_usuario,
        pago_id: record.pago_id,
        cajaid: record.cajaid
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    Caja.select("cajas.tipo","cajas.descripcion","cajas.fecha","cajas.monto","cajas.id","users.nombre as nombre_usuario","cajas.pago_id","cajas.cajaid")
    .joins("LEFT JOIN users ON users.id = cajas.user_id")
    .where("ISNULL(cajas.deleted) AND cajas.almacene_id = ?",params[:idalmacen])
    .order("cajas.id DESC")
  end

  def filter_nombre_usuario_condition
    ->(column) {
      Arel.sql("users.nombre LIKE '%#{column}%'")
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
