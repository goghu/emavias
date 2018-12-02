class DerivacionesController < ApplicationController
  before_action :set_derivacione, only: [:show, :edit, :update, :destroy]
  layout "template"

  # GET /derivaciones
  # GET /derivaciones.json
  def index
    @derivaciones = Derivacione.all
  end

  # GET /derivaciones/1
  # GET /derivaciones/1.json
  def show
  end

  # GET /derivaciones/new
  def new
    @derivacione = Derivacione.new
  end

  # GET /derivaciones/1/edit
  def edit
  end

  # POST /derivaciones
  # POST /derivaciones.json
  def create
    @derivacione = Derivacione.new(derivacione_params)

    respond_to do |format|
      if @derivacione.save
        format.html { redirect_to @derivacione, notice: "Derivacione was successfully created." }
        format.json { render :show, status: :created, location: @derivacione }
      else
        format.html { render :new }
        format.json { render json: @derivacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /derivaciones/1
  # PATCH/PUT /derivaciones/1.json
  def update
    respond_to do |format|
      if @derivacione.update(derivacione_params)
        format.html { redirect_to @derivacione, notice: "Derivacione was successfully updated." }
        format.json { render :show, status: :ok, location: @derivacione }
      else
        format.html { render :edit }
        format.json { render json: @derivacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /derivaciones/1
  # DELETE /derivaciones/1.json
  def destroy
    @derivacione.destroy
    respond_to do |format|
      format.html { redirect_to derivaciones_url, notice: "Derivacione was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def guarda_derivacion
    byebug
    consulta = Derivacione.where(compra_id: params[:compra_id]).last
    c_derivacion = Derivacione.find(consulta.id)
    c_derivacion.estado = "Derivado"
    c_derivacion.save

    m_derivacion = Derivacione.new
    m_derivacion.compra_id = params[:compra_id]
    m_derivacion.usero_id = params[:usero_id]
    m_derivacion.unidadeo_id = params[:unidadeo_id]
    m_derivacion.userd_id = params[:userd_id]
    m_derivacion.unidadd_id = params[:unidadd_id]
    m_derivacion.correlativo = params[:correlativo]
    m_derivacion.ruta_id = params[:ruta_id]
    m_derivacion.cargoo_id = params[:cargoo_id]
    m_derivacion.cargod_id = params[:cargod_id]
    m_derivacion.camino_id = params[:camino_id]
    m_derivacion.estado = "Recibido"
    m_derivacion.fecha = Date.current
    m_derivacion.save

    redirect_to controller: "compras", action: "bandeja_entrada"
  end

  def ver_documento
    # byebug
    @derivacion = Derivacione.find(params[:id_derivacion])
    @items = 
    if @derivacion.ruta_id.present?
      siguiente = @derivacion.correlativo.to_i + 1
      @camino = Camino.where(ruta_id: @derivacion.ruta_id, correlativo: siguiente).take
      if @camino.present?
        siguiente_cargo = User.where(cargo_id: @camino.cargo_id, deleted: nil).take
        @siguiente_funcionario = siguiente_cargo

        @documentos = Documento.where(camino_id: @derivacion.camino_id)
      end
    else
      @rpa = User.where(unidade_id: 5, cargo_id: 41, deleted: nil).take
    end
    # byebug
    # @ultimo_paso = Derivacione.where(compra_id: @documento.compra_id).last
  end

  def ver_documento_rpa
    # byebug
    @documento = Derivacione.find(params[:id_derivacion])

    # byebug
  end

  def ver_derivaciones
    @derivaciones = Derivacione.where(compra_id: params[:id_compra])
    @compra = Compra.find(params[:id_compra])
    # byebug
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_derivacione
    @derivacione = Derivacione.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def derivacione_params
    params.require(:derivacione).permit(:usero_id, :unidadeo_id, :userd_id, :unidadd_id, :fecha, :estado, :observaciones, :cargoo_id, :cargod_id)
  end
end
