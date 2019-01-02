class ReportesController < ApplicationController
  layout "template"

  def tramites
  end

  def fechas
  end

  def por_numero
    # byebug
    if params[:busca_por] == 'numero'
      @compra = Compra.where("numero = ?", params[:docvalor]).take
    else
      @compra = Compra.where("docvalor = ?", params[:docvalor]).take
    end

    if @compra.present?
      @derivaciones = Derivacione.where(compra_id: @compra.id).order(id: :asc)
    else
      @derivacione = nil      
    end
  end

  def por_usuario
    @mi_poder = Derivacione.where(userd_id: params[:reporte][:usuario], estado: 'Recibido').group(:compra_id)
    @derivados = Derivacione.where(userd_id: params[:reporte][:usuario], estado: 'Derivado').group(:compra_id)
    @usuario = User.find(params[:reporte][:usuario])
    # byebug
  end

  def por_fecha
    @fecha_inicio = params[:fechai].to_date
    @fecha_fin = params[:fechaf].to_date
    @derivaciones = Derivacione.where(created_at: (@fecha_inicio.beginning_of_day..@fecha_fin.end_of_day)).group(:compra_id)
    # byebug
  end

  def por_unidad
    @fecha_inicio = params[:fechai].to_date
    @fecha_fin = params[:fechaf].to_date
    @derivaciones = Derivacione.where(created_at: (@fecha_inicio.beginning_of_day..@fecha_fin.end_of_day), unidadd_id: params[:reporte][:unidad]).group(:compra_id)
    if @derivaciones.present?
      derivacion = @derivaciones.take
      
      # byebug
    end
    
    @unidad = Unidade.find(params[:reporte][:unidad])
    # byebug
  end
  
  
end
