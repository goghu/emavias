class ProductoDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Producto.id", cond: :eq },
      nombre: { source: "Producto.nombre", cond: :like },
      direccion: { source: "Producto.direccion", cond: :like },
      #image_tag: {source:"image_tag", cond: filter_image_tag},
      codigo: { source: "Producto.codigo", cond: :like },
      # descripcion: { source: "Producto.descripcion", cond: :like },
      precio: { source: "Producto.precio", cond: :eq },
      categoria: { source: "Producto.categorium.nombre", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        direccion: record.direccion,
        # image_tag: image_tag("/productos/direccion"),
        codigo: record.codigo,
        nombre: record.nombre,
        # descripcion: record.descripcion,
        precio: record.precio,
        categoria: record.categorium.nombre,
      }
    end
  end

  private

  def get_raw_records
    # insert query here

    Producto.where(deleted: nil).order('created_at DESC')
    
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
