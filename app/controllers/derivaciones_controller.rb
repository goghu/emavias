class DerivacionesController < ApplicationController
  before_action :set_derivacione, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @derivacione, notice: 'Derivacione was successfully created.' }
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
        format.html { redirect_to @derivacione, notice: 'Derivacione was successfully updated.' }
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
      format.html { redirect_to derivaciones_url, notice: 'Derivacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_derivacione
      @derivacione = Derivacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def derivacione_params
      params.require(:derivacione).permit(:usero_id, :unidadeo_id, :userd_id, :unidadd_id, :fecha, :estado, :observaciones)
    end
end
