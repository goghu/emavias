class MigracionesController < ApplicationController
  before_action :set_migracione, only: [:show, :edit, :update, :destroy]

  # GET /migraciones
  # GET /migraciones.json
  def index
    @migraciones = Migracione.all
  end

  # GET /migraciones/1
  # GET /migraciones/1.json
  def show
  end

  # GET /migraciones/new
  def new
    @migracione = Migracione.new
  end

  # GET /migraciones/1/edit
  def edit
  end

  # POST /migraciones
  # POST /migraciones.json
  def create
    @migracione = Migracione.new(migracione_params)

    respond_to do |format|
      if @migracione.save
        format.html { redirect_to @migracione, notice: 'Migracione was successfully created.' }
        format.json { render :show, status: :created, location: @migracione }
      else
        format.html { render :new }
        format.json { render json: @migracione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /migraciones/1
  # PATCH/PUT /migraciones/1.json
  def update
    respond_to do |format|
      if @migracione.update(migracione_params)
        format.html { redirect_to @migracione, notice: 'Migracione was successfully updated.' }
        format.json { render :show, status: :ok, location: @migracione }
      else
        format.html { render :edit }
        format.json { render json: @migracione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /migraciones/1
  # DELETE /migraciones/1.json
  def destroy
    @migracione.destroy
    respond_to do |format|
      format.html { redirect_to migraciones_url, notice: 'Migracione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_migracione
      @migracione = Migracione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def migracione_params
      params.require(:migracione).permit(:cite, :documento, :fecha)
    end
end
