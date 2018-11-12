class GestionesController < ApplicationController
  before_action :set_gestione, only: [:show, :edit, :update, :destroy]

  # GET /gestiones
  # GET /gestiones.json
  def index
    @gestiones = Gestione.all
  end

  # GET /gestiones/1
  # GET /gestiones/1.json
  def show
  end

  # GET /gestiones/new
  def new
    @gestione = Gestione.new
  end

  # GET /gestiones/1/edit
  def edit
  end

  # POST /gestiones
  # POST /gestiones.json
  def create
    @gestione = Gestione.new(gestione_params)

    respond_to do |format|
      if @gestione.save
        format.html { redirect_to @gestione, notice: 'Gestione was successfully created.' }
        format.json { render :show, status: :created, location: @gestione }
      else
        format.html { render :new }
        format.json { render json: @gestione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gestiones/1
  # PATCH/PUT /gestiones/1.json
  def update
    respond_to do |format|
      if @gestione.update(gestione_params)
        format.html { redirect_to @gestione, notice: 'Gestione was successfully updated.' }
        format.json { render :show, status: :ok, location: @gestione }
      else
        format.html { render :edit }
        format.json { render json: @gestione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gestiones/1
  # DELETE /gestiones/1.json
  def destroy
    @gestione.destroy
    respond_to do |format|
      format.html { redirect_to gestiones_url, notice: 'Gestione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gestione
      @gestione = Gestione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gestione_params
      params.require(:gestione).permit(:numero)
    end
end
