class ParametroDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Parametro.id", cond: :eq },
      nit: { source: "Parametro.nit", cond: :like },
      numero_autorizacion: { source: "Parametro.numero_autorizacion", cond: :like },
      llave: { source: "Parametro.llave", cond: :like },
      numero_ref: { source: "Parametro.numero_ref", cond: :like },
      fechalimite: { source: "Parametro.fechalimite", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        nit: record.nit,
        numero_autorizacion: record.numero_autorizacion,
        llave: record.llave,
        numero_ref: record.numero_ref,
        fechalimite: record.fechalimite
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    Parametro.where(deleted: nil).order('id DESC')
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
