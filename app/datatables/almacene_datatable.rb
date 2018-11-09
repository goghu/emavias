class AlmaceneDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Almacene.id", cond: :eq },
      nombre: { source: "Almacene.nombre", cond: :like },
      telefonos: { source: "Almacene.telefonos", cond: :like },
      direccion: { source: "Almacene.direccion", cond: :like },
      # email: { source: "Almacene.email", cond: :like },
      # descripcion: { source: "Almacene.descripcion", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        nombre: record.nombre,
        telefonos: record.telefonos,
        direccion: record.direccion,
        # email: record.email,
        # descripcion: record.descripcion
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    Almacene.where(deleted: nil).order('created_at DESC')
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
