class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :edit, :update, :destroy]
  layout "template"

  # GET /cargos
  # GET /cargos.json
  def index
    @cargos = Cargo.all
  end

  # GET /cargos/1
  # GET /cargos/1.json
  def show
  end

  # GET /cargos/new
  def new
    @cargo = Cargo.new
  end

  # GET /cargos/1/edit
  def edit
  end

  # POST /cargos
  # POST /cargos.json
  def create
    @cargo = Cargo.new(cargo_params)

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to @cargo, notice: 'Cargo was successfully created.' }
        format.json { render :show, status: :created, location: @cargo }
      else
        format.html { render :new }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cargos/1
  # PATCH/PUT /cargos/1.json
  def update
    respond_to do |format|
      if @cargo.update(cargo_params)
        format.html { redirect_to @cargo, notice: 'Cargo was successfully updated.' }
        format.json { render :show, status: :ok, location: @cargo }
      else
        format.html { render :edit }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cargos/1
  # DELETE /cargos/1.json
  def destroy
    @cargo.destroy
    respond_to do |format|
      format.html { redirect_to cargos_url, notice: 'Cargo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def excel
    dir = Rails.root.join("public", "excels", "unidades.xlsx")
    workbook = RubyXL::Parser.parse(dir)
    workbook.worksheets[0] # Returns first worksheet
    workbook[0]            # Returns first worksheet
    workbook["Sheet1"]     # Finds and returns worksheet titled "Sheet1"

    # importacion de cargos

    # sheet1 = workbook[0]
    # cant_filas = sheet1.sheet_data.size
    # cant_filas.times do |cont|
    #   if cont == 0
    #     puts "cabeceras"
    #   else
    #     puts "No. -- #{workbook[0][cont][0].value}"
    #     puts "Des -- #{workbook[0][cont][1].value}"
    #     mod_cargo = Cargo.new
    #     mod_cargo.descripcion = workbook[0][cont][1].value.to_s
    #     mod_cargo.save

    # fin importacion de cargos

    # importacion de unidades

    # sheet1 = workbook[0]
    # cant_filas = sheet1.sheet_data.size
    # cant_filas.times do |cont|
    #   if cont == 0
    #     puts "cabeceras"
    #   else
    #     puts "No. -- #{workbook[0][cont][0].value}"
    #     puts "Des -- #{workbook[0][cont][1].value}"
    #     mod_unidade = Unidade.new
    #     mod_unidade.descripcion = workbook[0][cont][1].value.to_s
    #     mod_unidade.save

    # fin importacion de unidades

    # importacion de personas

    sheet1 = workbook[0]
    cant_filas = sheet1.sheet_data.size
    cant_filas.times do |cont|
      if cont == 0
        puts "cabeceras"
      else
        puts "No. -- #{workbook[0][cont][0].value}"
        puts "Unidad -- #{workbook[0][cont][1].value}"
        puts "Cargo -- #{workbook[0][cont][2].value}"
        puts "Nombre -- #{workbook[0][cont][3].value}"
        mod_usuario = User.create
        unidad = Unidade.where(descripcion: workbook[0][cont][1].value)
        if unidad.present?
          mod_usuario = unidad.id
        end
        if prod
          puts "el resultado es: #{prod.nombre}"
          puts "el id es: #{prod.id}"
          p_mod = Paquete.find_by(producto_id: prod.id)
          p_mod.nombre = prod.codigo.to_s + " Caja " + workbook[0][cont][3].value.to_s + " U"
          p_mod.cantidad = workbook[0][cont][3].value
          p_mod.cantidad_real = workbook[0][cont][3].value
          p_mod.save
        end

    # fin importacion de personas

      end
    end
    # byebug
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cargo_params
      params.require(:cargo).permit(:descripcion, :nivel, :unidade_id)
    end
end
