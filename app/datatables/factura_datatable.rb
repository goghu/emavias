class FacturaDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Factura.id", cond: :eq },
      numero: { source: "Factura.numero", cond: :like },
      codigo_control: { source: "Factura.codigo_control", cond: :like },
      autorizacion: { source: "Factura.autorizacion", cond: :like },
      cliente: { source: "Factura.cliente", cond: :like },
      importe_total: { source: "Factura.importe_total", cond: :like },
      fecha: { source: "Factura.fecha", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        numero: record.numero,
        codigo_control: record.codigo_control,
        autorizacion: record.autorizacion,
        cliente: record.cliente,
        importe_total: record.importe_total,
        fecha: record.fecha,
        anulado: record.anulado
      }
    end
  end

  private

  def get_raw_records
    idAlmacen = params[:almacene_id]
    @factura = Factura.select("facturas.id","facturas.numero","facturas.codigo_control","facturas.autorizacion","facturas.cliente","facturas.importe_total","facturas.fecha","facturas.anulado")
    .joins("INNER JOIN ventas ON facturas.numero_venta = ventas.numero")
    .joins("INNER JOIN cotizaciones ON ventas.cotizacione_id = cotizaciones.id")
    .joins("INNER JOIN almacenes ON cotizaciones.almacene_id = almacenes.id AND almacenes.id = #{idAlmacen}")
    .group("facturas.id","facturas.numero","facturas.codigo_control","facturas.autorizacion","facturas.cliente","facturas.importe_total","facturas.fecha","facturas.anulado")
    .order('facturas.created_at DESC')
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
