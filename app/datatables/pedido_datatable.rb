class PedidoDatatable < AjaxDatatablesRails::Base


    def view_columns
      # Declare strings in this format: ModelName.column_name
      # or in aliased_join_table.column_name format
      @view_columns ||= {
        numero: { source: "Pedido.numero", cond: :eq },
        fecha_c: { source: "Pedido.fecha", cond: :like }
      }
    end
  
    def data
      records.map do |record|
        {
          # example:
          numero: record.numero,
          fecha_c: record.fecha_c
        }
      end
    end
  
    private
  
    def get_raw_records
      # insert query here
      Pedido.select('pedidos.numero','pedidos.fecha as fecha_c')
      .where('pedidos.deleted IS NULL AND pedidos.almacene_id = ?',params[:idalmacen])
      .group('pedidos.numero','pedidos.fecha')
      .order("pedidos.numero DESC")
      .distinct
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
  