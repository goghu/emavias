class ComprasDatatable < AjaxDatatablesRails::Base

  # def_delegators :@view, :mis_compras_path

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Compra.id", cond: :eq },
      numero: { source: "Compra.numero", cond: :like },
      fecha: { source: "Compra.fecha", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        numero: record.numero,
        fecha: record.fecha
      }
    end
  end

  private

  def get_raw_records
    # insert query here
    id_usuario = params[:usuario]
    # byebug
    # id_usuario = 1.to_i
    # byebug
    Compra.where(user_id: id_usuario).order('created_at DESC')
    # Compra.all
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
