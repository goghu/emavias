class RutaController < ApplicationController
  before_action :set_rutum, only: [:show, :edit, :update, :destroy]

  layout "template"

  # GET /ruta
  # GET /ruta.json
  def index
    @ruta = Ruta.all
  end

  # GET /ruta/1
  # GET /ruta/1.json
  def show
  end

  # GET /ruta/new
  def new
    @ruta = Ruta.new
  end

  # GET /ruta/1/edit
  def edit
  end

  def editar
    
  end

  # POST /ruta
  # POST /ruta.json
  def crear
    # byebug
    @ruta = Ruta.new
    @ruta.nombre = params[:ruta][:nombre]
    @ruta.descripcion = params[:ruta][:descripcion]
    @ruta.save
    redirect_to action: "index"
    # respond_to do |format|
    #   if @ruta.save
    #     format.html { redirect_to @ruta, notice: "Rutum was successfully created." }
    #     format.json { render :show, status: :created, location: @ruta }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @ruta.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /ruta/1
  # PATCH/PUT /ruta/1.json
  def update
    respond_to do |format|
      if @rutum.update(rutum_params)
        format.html { redirect_to @rutum, notice: "Rutum was successfully updated." }
        format.json { render :show, status: :ok, location: @rutum }
      else
        format.html { render :edit }
        format.json { render json: @rutum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ruta/1
  # DELETE /ruta/1.json
  def destroy
    @rutum.destroy
    respond_to do |format|
      format.html { redirect_to ruta_url, notice: "Rutum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def ver_caminos
    # byebug
    @caminos = Camino.order(correlativo: :asc).where(ruta_id: params[:id_ruta])
    @ruta = Ruta.find(params[:id_ruta])
    # respond_to do |format|
    #   format.html { @ruta }
    #   format.json { render json: @ruta }
    # end
  end

  def muestra_funcionarios
    # byebug
    @unidad = params[:id_unidad]
    @funcionarios = User.where(unidade_id: params[:id_unidad])
    render layout: false
  end

  def muestra_cargos
    @unidad = params[:id_unidad]
    @cargos = Cargo.where(unidade_id: params[:id_unidad])
    render layout: false
  end

  def guarda_camino
    # byebug
    @n_camino = Camino.new
    @n_camino.ruta_id = params[:camino][:ruta_id]
    @n_camino.unidade_id = params[:camino][:unidade_id]
    @n_camino.correlativo = params[:camino][:correlativo]
    @n_camino.user_id = params[:camino][:user_id]
    @n_camino.cargo_id = params[:camino][:cargo_id]
    @n_camino.save
    redirect_to action: "ver_caminos", id_ruta: params[:camino][:ruta_id]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rutum
    @rutum = Rutum.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rutum_params
    params.require(:rutum).permit(:nombre, :descripcion, :ruta_id, :unidade_id)
  end
end
