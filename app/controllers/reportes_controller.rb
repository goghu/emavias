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
  
end
