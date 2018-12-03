class DocderivacionesController < ApplicationController
  before_action :set_docderivacione, only: [:show, :edit, :update, :destroy]

  # GET /docderivaciones
  # GET /docderivaciones.json
  def index
    @docderivaciones = Docderivacione.all
  end

  # GET /docderivaciones/1
  # GET /docderivaciones/1.json
  def show
  end

  # GET /docderivaciones/new
  def new
    @docderivacione = Docderivacione.new
  end

  # GET /docderivaciones/1/edit
  def edit
  end

  # POST /docderivaciones
  # POST /docderivaciones.json
  def create
    @docderivacione = Docderivacione.new(docderivacione_params)

    respond_to do |format|
      if @docderivacione.save
        format.html { redirect_to @docderivacione, notice: 'Docderivacione was successfully created.' }
        format.json { render :show, status: :created, location: @docderivacione }
      else
        format.html { render :new }
        format.json { render json: @docderivacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docderivaciones/1
  # PATCH/PUT /docderivaciones/1.json
  def update
    respond_to do |format|
      if @docderivacione.update(docderivacione_params)
        format.html { redirect_to @docderivacione, notice: 'Docderivacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @docderivacione }
      else
        format.html { render :edit }
        format.json { render json: @docderivacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docderivaciones/1
  # DELETE /docderivaciones/1.json
  def destroy
    @docderivacione.destroy
    respond_to do |format|
      format.html { redirect_to docderivaciones_url, notice: 'Docderivacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docderivacione
      @docderivacione = Docderivacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def docderivacione_params
      params.require(:docderivacione).permit(:camino_id, :descripcion, :docvalor, :presento, :estado)
    end
end
