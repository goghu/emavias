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
      @compra = Compra.where("numero = ?", params[:docvalor]).take
    end
    @derivaciones = Derivacione.where(compra_id: @compra.id).order(id: :asc)
  end
  
end
