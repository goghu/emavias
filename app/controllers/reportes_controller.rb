class ReportesController < ApplicationController
  layout "template"

  def tramites
  end

  def fechas
  end

  def por_numero
    # byebug
    if params[:busca_por] == 'numero'
      @compra = Compra.where("numero = ?", params[:docvalor])
    else
      @compra = Compra.where("numero = ?", params[:docvalor])
    end
  end
  
end
