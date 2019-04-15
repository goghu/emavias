class EscogidosController < ApplicationController
  before_action :set_escogido, only: [:show, :edit, :update, :destroy]

  # GET /escogidos
  # GET /escogidos.json
  def index
    @escogidos = Escogido.all
  end

  # GET /escogidos/1
  # GET /escogidos/1.json
  def show
  end

  # GET /escogidos/new
  def new
    @escogido = Escogido.new
  end

  # GET /escogidos/1/edit
  def edit
  end

  # POST /escogidos
  # POST /escogidos.json
  def create
    @escogido = Escogido.new(escogido_params)

    respond_to do |format|
      if @escogido.save
        format.html { redirect_to @escogido, notice: 'Escogido was successfully created.' }
        format.json { render :show, status: :created, location: @escogido }
      else
        format.html { render :new }
        format.json { render json: @escogido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /escogidos/1
  # PATCH/PUT /escogidos/1.json
  def update
    respond_to do |format|
      if @escogido.update(escogido_params)
        format.html { redirect_to @escogido, notice: 'Escogido was successfully updated.' }
        format.json { render :show, status: :ok, location: @escogido }
      else
        format.html { render :edit }
        format.json { render json: @escogido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /escogidos/1
  # DELETE /escogidos/1.json
  def destroy
    @escogido.destroy
    respond_to do |format|
      format.html { redirect_to escogidos_url, notice: 'Escogido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_escogido
      @escogido = Escogido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def escogido_params
      params.require(:escogido).permit(:memo_id, :user_id)
    end
end
