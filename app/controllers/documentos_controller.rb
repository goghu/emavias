class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :edit, :update, :destroy]
    layout "template"


  # GET /documentos
  # GET /documentos.json
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1
  # GET /documentos/1.json
  def show
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos
  # POST /documentos.json
  def create
    @documento = Documento.new(documento_params)

    respond_to do |format|
      if @documento.save
        format.html { redirect_to @documento, notice: 'Documento was successfully created.' }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1
  # PATCH/PUT /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to @documento, notice: 'Documento was successfully updated.' }
        format.json { render :show, status: :ok, location: @documento }
      else
        format.html { render :edit }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @documento.destroy
    respond_to do |format|
      format.html { redirect_to documentos_url, notice: 'Documento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def nuevo
    @listado_documentos = Documento.where(camino_id: params[:id_camino])
    @camino = Camino.find(params[:id_camino])
  end

  def guarda_nuevo
    # byebug
    m_documento = Documento.new
    m_documento.camino_id = params[:camino_id]  
    m_documento.descripcion = params[:descripcion]  
    m_documento.tipo = params[:tipo]  
    m_documento.presento = params[:presento]

    if params[:remitente] == 'Seleccione'
      params[:remitente] = nil
    end

    if params[:memorandum]==''
      params[:memorandum] = nil
    end

    m_documento.memorandum = params[:memorandum]
    m_documento.remitente = params[:remitente]
    m_documento.contenido = params[:contenido]
    m_documento.save
    redirect_to action: 'nuevo', id_camino: params[:camino_id]  
  end

  def eliminar
    Documento.destroy(params[:id_documento])
    redirect_to controller: 'documentos', action: 'nuevo', id_camino: params[:id_camino] 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_params
      params.require(:documento).permit(:descripcion, :correlativo, :presento, :observaciones)
    end
end
