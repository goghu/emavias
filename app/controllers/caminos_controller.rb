class CaminosController < ApplicationController
  before_action :set_camino, only: [:show, :edit, :update, :destroy]

  # GET /caminos
  # GET /caminos.json
  def index
    @caminos = Camino.all
  end

  # GET /caminos/1
  # GET /caminos/1.json
  def show
  end

  # GET /caminos/new
  def new
    @camino = Camino.new
  end

  # GET /caminos/1/edit
  def edit
  end

  # POST /caminos
  # POST /caminos.json
  def create
    @camino = Camino.new(camino_params)

    respond_to do |format|
      if @camino.save
        format.html { redirect_to @camino, notice: 'Camino was successfully created.' }
        format.json { render :show, status: :created, location: @camino }
      else
        format.html { render :new }
        format.json { render json: @camino.errors, status: :unprocessable_entity }
      end
    end
  end

  def carga_funcionario
    @camino = Camino.where(ruta_id: params[:proceso], correlativo: 1).take
    @funcionario = User.where(cargo_id: @camino.cargo_id, deleted: nil).take
    @ruta_id = params[:proceso]
    render layout: false
  end

  def eliminar
    # byebug
    Camino.destroy(params[:id_camino])
    redirect_to controller: 'ruta', action: 'ver_caminos', id_ruta: params[:cod_ruta] 
  end

  # PATCH/PUT /caminos/1
  # PATCH/PUT /caminos/1.json
  def update
    respond_to do |format|
      if @camino.update(camino_params)
        format.html { redirect_to @camino, notice: 'Camino was successfully updated.' }
        format.json { render :show, status: :ok, location: @camino }
      else
        format.html { render :edit }
        format.json { render json: @camino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caminos/1
  # DELETE /caminos/1.json
  def destroy
    @camino.destroy
    respond_to do |format|
      format.html { redirect_to caminos_url, notice: 'Camino was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camino
      @camino = Camino.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camino_params
      params.require(:camino).permit(:unidade_id, :alternativo, :correlativo)
    end
end
