class CategoriaDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Categorium.id", cond: :eq },
      nombre: { source: "Categorium.nombre", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        nombre: record.nombre
      }
    end
  end

  private

  def get_raw_records
    Categorium.select("id", "nombre")
    .where(borrado: nil)
    # insert query here
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
