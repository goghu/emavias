class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]
  layout "template"

  # GET /compras
  # GET /compras.json
  def index
    # @compras = Compra.all
    @usuario = current_user.id
    # byebug
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
  end

  # GET /compras/new
  def new
    @compra = Compra.new
  end

  # GET /compras/1/edit
  def edit
  end

  # POST /compras
  # POST /compras.json
  def create
    byebug
    @compra = Compra.new(compra_params)
    @compra.user_id=current_user.id
    # compra_params[:compra][:user_id]=current_user.id

    respond_to do |format|
      if @compra.save
        format.html { redirect_to @compra, notice: 'Compra was successfully created.' }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to @compra, notice: 'Compra was successfully updated.' }
        format.json {  render :show, status: :ok, location: @compra }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: 'Compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mis_compras
    # @compras = Compra.all
    # byebug
    # usuario = current_user.id
    respond_to do |format|
    format.html
    format.json { render json: ComprasDatatable.new(view_context) }
    end
  end

  def solicitudees_rpa
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:numero, :docvalor, :fecha)
    end
end
