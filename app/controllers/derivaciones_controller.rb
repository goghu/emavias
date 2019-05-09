class DerivacionesController < ApplicationController
  before_action :set_derivacione, only: [:show, :edit, :update, :destroy]
  layout "template"

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
        format.html { redirect_to @derivacione, notice: "Derivacione was successfully created." }
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
        format.html { redirect_to @derivacione, notice: "Derivacione was successfully updated." }
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
      format.html { redirect_to derivaciones_url, notice: "Derivacione was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def guarda_derivacion

    # byebug
    consulta = Derivacione.where(compra_id: params[:compra_id]).last
    c_derivacion = Derivacione.find(consulta.id)
    c_derivacion.estado = "Derivado"
    c_derivacion.save

    m_derivacion = Derivacione.new
    m_derivacion.compra_id = params[:compra_id]
    m_derivacion.usero_id = params[:usero_id]
    m_derivacion.unidadeo_id = params[:unidadeo_id]
    m_derivacion.userd_id = params[:userd_id]
    m_derivacion.unidadd_id = params[:unidadd_id]
    m_derivacion.correlativo = params[:correlativo]
    m_derivacion.ruta_id = params[:ruta_id]
    m_derivacion.cargoo_id = params[:cargoo_id]
    m_derivacion.cargod_id = params[:cargod_id]
    m_derivacion.camino_id = params[:camino_id]
    m_derivacion.observaciones = params[:observaciones]
    m_derivacion.pagado = params[:pagado]
    if params[:cargod_id] == '51'
      m_derivacion.estado = "Terminado"
    else
      m_derivacion.estado = "Recibido"
    end
    m_derivacion.fecha = Date.current
    m_derivacion.save

    if params[:docderivaciones].present? 
      params[:docderivaciones].each_pair do |indice, i|

        documento_derivacion = Docderivacione.new
        # guardamos el archivo
        archivo = i[:archivo]
        if archivo.present?
          # nombre_archivo = archivo.original_filename
          # File.open(Rails.root.join("public", "adjuntos", archivo.original_filename), "wb") do |file|
          #   file.write(archivo.read)
          # end

          # archivo = i[:archivo]
          name = archivo.original_filename
          directory = 'public/adjuntos'
          path = File.join(directory, name) 
          uniq_name = (0...10).map { (65 + rand(26)).chr }.join
          time_footprint = Time.now.to_formatted_s(:number)
          File.open(path, "wb") do |file|
            file.write(archivo.read)
            @uniq_path = File.join(directory, uniq_name + time_footprint + File.extname(file))
            File.rename(file, @uniq_path)
            documento_derivacion.adjunto = uniq_name + time_footprint + File.extname(file)
          end
          # byebug
        else
          # nombre_archivo = "S/I"
          documento_derivacion.adjunto = nil
        end
        # fin guardamos el archivo

        documento_derivacion.derivacione_id = i[:derivacione_id]
        documento_derivacion.camino_id = i[:camino_id]
        documento_derivacion.user_id = i[:user_id]
        documento_derivacion.unidade_id = i[:unidade_id]
        documento_derivacion.cargo_id = i[:cargo_id]
        documento_derivacion.compra_id = i[:compra_id]
        documento_derivacion.descripcion = i[:descripcion]
        documento_derivacion.docvalor = i[:docvalor]
        documento_derivacion.presento = i[:presento]
        documento_derivacion.save
      end
    end

    # guardamos memorandum
    if params[:memo].present?
      m_memo = Memo.new
      m_memo.remitente_id = params[:memo][:remitente]
      m_memo.documento = params[:memo][:contenido]
      m_memo.compra_id = params[:compra_id]
      m_memo.usero_id = params[:usero_id]
      m_memo.correlativo = params[:correlativo]
      m_memo.ruta_id = params[:ruta_id]
      m_memo.camino_id = params[:camino_id]
      m_memo.save
      id_memo = m_memo.id
      # guardamos los escogidos
      array_escojidos = params[:memo][:valores_personal]
      array_escojidos.split(",").each do |ae|
        # puts "#{ae}"
        m_escojidos = Escogido.new
        m_escojidos.memo_id = id_memo
        m_escojidos.user_id = ae
        m_escojidos.save
      end

      # fin guardamos los escogidos
    end
    # fin guardamos memorandum

    redirect_to controller: "compras", action: "bandeja_entrada"
  end

  def ver_documento

    @derivacion = Derivacione.find(params[:id_derivacion])
    # si tiene subcaminos mandamos para que sea combo
    sub_caminos = Alternativo.where(ruta_id: @derivacion.ruta_id, camino_id: @derivacion.camino_id).take
    # byebug
    if sub_caminos.present?
      @s_caminos = sub_caminos
    else
      # adicionamos uno al correlavito
      siguiente = @derivacion.correlativo.to_i + 1
      # buscamos el siguiente camino
      @camino = Camino.where(ruta_id: @derivacion.ruta_id, correlativo: siguiente).take
      # byebug
      # si no es archivo central
      # if @camino.cargo_id != 46
      if @camino.present?
        # si el cargo es comision de recepcion y calificacion
        if @camino.cargo_id == 47 || @camino.cargo_id == 48
          # byebug
          primer_funcionario = Derivacione.where(compra_id: @derivacion.compra_id).first
          funcionario = User.find(primer_funcionario.usero_id)
          @siguiente_funcionario = funcionario
        else
          # byebug
          @siguiente_funcionario = User.where(cargo_id: @camino.cargo_id, deleted: nil).take
        end
      else
        @camino = nil
      end
    end
    # los documentos y llenados
    @docderivaciones = Docderivacione.where(compra_id: @derivacion.compra_id)
    # enviamos los memos
    @memorandum = Documento.where(camino_id: @derivacion.camino_id).where.not('memorandum'=>nil).take
    # completa memo
    @completa_memo = Memo.where(camino_id: @derivacion.camino_id)
    # enviamos los documentos para el formulario
    @documentos = Documento.where(camino_id: @derivacion.camino_id).where.not('tipo'=>nil)
    # listamos el personal para enviar a la vista
    @personal = User.where(rol: 'Funcionario')

    # fin si tiene subcaminos mandamos para que sea combo
    
    # byebug
    # @ultimo_paso = Derivacione.where(compra_id: @documento.compra_id).last
  end

  def ver_documento_jefe
    @documento = Derivacione.find(params[:id_derivacion])
    @rpa = User.where(unidade_id: 5, cargo_id: 12, deleted: nil).take
  end

  def ver_documento_rpa
    # byebug
    # buscamos la derivacion
    @documento = Derivacione.find(params[:id_derivacion])
    # @cantidad_rpa = Derivacione.where(compra_id: @documento.compra_id, cargod_id: 41).count
  end

  def ver_derivaciones
    numeros = [1, 2, 3]
    @derivaciones = Derivacione.where(compra_id: params[:id_compra])
    @compra = Compra.find(params[:id_compra])
    # byebug
  end

  def ver_memo
    
  end

  def genera_memo
    m_memo = Memo.find(params[:memo_id])
    m_memo.cite = params[:cite]
    m_memo.documento = params[:documento]
    m_memo.fecha = params[:fecha]
    m_memo.save
    @datos_memo = Memo.find(params[:memo_id])
    render layout: false
    # byebug
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_derivacione
    @derivacione = Derivacione.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def derivacione_params
    params.require(:derivacione).permit(:usero_id, :unidadeo_id, :userd_id, :unidadd_id, :fecha, :estado, :observaciones, :cargoo_id, :cargod_id)
  end
end
