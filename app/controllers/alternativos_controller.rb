class AlternativosController < ApplicationController
  before_action :set_alternativo, only: [:show, :edit, :update, :destroy]
  layout "template"

  # GET /alternativos
  # GET /alternativos.json
  def index
    @alternativos = Alternativo.all
  end

  # GET /alternativos/1
  # GET /alternativos/1.json
  def show
  end

  # GET /alternativos/new
  def new
    @alternativo = Alternativo.new
  end

  # GET /alternativos/1/edit
  def edit
  end

  # POST /alternativos
  # POST /alternativos.json
  def create
    @alternativo = Alternativo.new(alternativo_params)

    respond_to do |format|
      if @alternativo.save
        format.html { redirect_to @alternativo, notice: 'Alternativo was successfully created.' }
        format.json { render :show, status: :created, location: @alternativo }
      else
        format.html { render :new }
        format.json { render json: @alternativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alternativos/1
  # PATCH/PUT /alternativos/1.json
  def update
    respond_to do |format|
      if @alternativo.update(alternativo_params)
        format.html { redirect_to @alternativo, notice: 'Alternativo was successfully updated.' }
        format.json { render :show, status: :ok, location: @alternativo }
      else
        format.html { render :edit }
        format.json { render json: @alternativo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alternativos/1
  # DELETE /alternativos/1.json
  def destroy
    @alternativo.destroy
    respond_to do |format|
      format.html { redirect_to alternativos_url, notice: 'Alternativo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def nuevo
    @datos_camino = Camino.find(params[:id_camino])
    @listado_alternativos = Alternativo.where(camino_id: params[:id_camino])
  end

  def guarda_nuevo
    # byebug
    m_alternativo = Alternativo.new
    m_alternativo.camino_id = params[:alternativo][:camino_id]
    m_alternativo.ruta_id = params[:alternativo][:ruta_id]
    m_alternativo.alternativo_id = params[:alternativo][:alt]
    m_alternativo.save
    redirect_to action: :nuevo, id_camino: params[:alternativo][:camino_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alternativo
      @alternativo = Alternativo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alternativo_params
      params.require(:alternativo).permit(:ruta_id, :alternativo_id, :estado, :obs)
    end
end
