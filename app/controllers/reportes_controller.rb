class ReportesController < ApplicationController
  layout "template"

  def tramites
  end

  def fechas
  end

  def por_numero
    # byebug
    if params[:busca_por] == 'numero'
      @compra = Compra.where("numero = ?", params[:numero]).take
    else
      @compra = Compra.where("docvalor = ?", params[:docvalor]).take
    end
    if @compra.present?
      @derivaciones = Derivacione.where(compra_id: @compra.id).order(id: :asc)
    else
      @derivacione = nil      
    end
  end
  
end
