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
    # byebug
    @compra = Compra.new(compra_params)
    @compra.user_id = current_user.id
    if params[:compra][:existencia]
      @compra.existencia = 1
    end
    if params[:compra][:poa]
      @compra.poa = 1
    end
    if params[:compra][:presupuestaria]
      @compra.presupuestaria = 1
    end
    if params[:compra][:cotizacion]
      @compra.cotizacion = 1
    end
    if params[:compra][:especificaciones]
      @compra.especificaciones = 1
    end
    if params[:compra][:autorizaciones]
      @compra.autorizaciones = 1
    end

    numero = 1
    ultima_compra = Compra.last
    # byebug
    if ultima_compra.present?
      # ultima_compra.numero.to_i
      @compra.numero = ultima_compra.numero.to_i + numero
    else
      @compra.numero = numero
    end
    # compra_params[:compra][:user_id]=current_user.id
    items = params["item"]
    respond_to do |format|
      if @compra.save
        id_compra = @compra.id
        # items.map {|item| Item.new(item).save }
        items.each_pair do |indice, i|
          mod_item = Item.new
          mod_item.compra_id = id_compra
          mod_item.descripcion = i["descripcion"]
          mod_item.unidad = i["unidad"]
          mod_item.cantidad = i["cantidad"]
          mod_item.p_unitario = i["p_unitario"]
          mod_item.p_referencial = i["p_referencial"]
          mod_item.save
        end
        format.html { redirect_to action: "mis_tramites" }
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
        format.html { redirect_to @compra, notice: "Compra was successfully updated." }
        format.json { render :show, status: :ok, location: @compra }
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
      format.html { redirect_to compras_url, notice: "Compra was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def mis_compras
    # @compras = Compra.all
    # byebug
    # usuario = current_user.id
    # respond_to do |format|
    #   format.html
    #   format.json { render json: ComprasDatatable.new(view_context) }
    # end
  end

  def edita_compra
    # byebug
    @items_datos = Item.where(compra_id: params[:id_compra])
  end

  def mis_tramites
    id_usuario = current_user.id
    # @compras = Compra.where(user_id: id_usuario).last(350)
    # @compras = Compra.where(user_id: id_usuario).joins("LEFT JOIN derivaciones ON compra.id = derivaciones.compra_id")
    @compras = Compra.where(user_id: id_usuario).joins("LEFT JOIN derivaciones ON compras.id = derivaciones.compra_id").where('derivaciones.compra_id IS ?', nil)
  end

  def imprime_solicitud
    # byebug
    @solicitud = Compra.find(params[:id_compra])
  end

  def derivar
  end

  def solicitudes_rpa
  end

  def completa_solicitud
    # params
    modelo_compra = Compra.find(params[:compra_id])
    # byebug
    if params[:existencia]
      modelo_compra.existencia = 1
    end
    if params[:autorizaciones]
      modelo_compra.autorizaciones = 1
    end
    if params[:poa]
      modelo_compra.poa = 1
    end
    if params[:presupuestaria]
      modelo_compra.presupuestaria = 1
    end
    if params[:especificaciones]
      modelo_compra.especificaciones = 1
    end
    if params[:cotizacion]
      modelo_compra.cotizacion = 1
    end

    modelo_compra.docvalor = params[:docvalor]
    modelo_compra.fecha = params[:fecha]
    modelo_compra.obs = params[:obs]
    modelo_compra.save

    modelo_derivacion = Derivacione.new
    modelo_derivacion.usero_id = params[:usero_id]
    modelo_derivacion.unidadeo_id = params[:unidado_id]
    modelo_derivacion.userd_id = params[:userd_id]
    modelo_derivacion.unidadd_id = params[:unidadd_id]
    modelo_derivacion.compra_id = params[:compra_id]
    modelo_derivacion.fecha = params[:fecha]
    modelo_derivacion.estado = 'Recibido'
    modelo_derivacion.save
    redirect_to action: 'mis_tramites'
  end

  def asignar
    @compra = Compra.find(params[:id_compra])
  end

  def bandeja_entrada
    @documentos = Derivacione.where("userd_id = ? AND estado = ?", current_user.id, 'Recibido').last(350)
    # @documentos = Derivacione.where("userd_id = ?", current_user.id).last(350)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_compra
    @compra = Compra.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def compra_params
    params.require(:compra).permit(:numero, :docvalor, :fecha, :existencia, :poa, :presupuestaria, :cotizacion, :especificaciones, :autorizaciones, :fecha)
  end
end
