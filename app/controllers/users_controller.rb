class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  layout "template"
  # GET /users
  # GET /users.json
  def index

    # @users = User.where(deleted: nil)
    @users = User.all
    #byebug
    # respond_to do |format|
    #   format.html
    #   format.json { render json: UserDatatable.new(view_context) }
    # end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    render layout: false
  end

  # GET /users/1/edit
  def edit
    @rol = current_user.rol
    render layout: false
  end

  # POST /users
  # POST /users.json
  def create
    parausuarios = user_params
    if user_params[:contra2] != ""
      parausuarios[:password] = user_params[:contra2]
    end
    # byebug
    @user = User.new(parausuarios)
    if params[:jefe].present?
      @user.jefe = 1
    end

    respond_to do |format|
      if @user.save
        format.html {
          flash[:msgbueno] = "Se ha registrado correctamente correctamente el usuario"
          redirect_to users_url
        }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      # byebug
      parausuarios = user_params
      if user_params[:contra2] != ""
        parausuarios[:password] = user_params[:contra2]
      end
      if @user.update(parausuarios)
        format.html {
          flash[:msgbueno] = "Se ha registrado correctamente los cambios del usuario"
          redirect_to users_url
        }
        format.json { render json: {}, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.deleted = Time.now
    @user.save
    respond_to do |format|
      format.html {
        flash[:msgbueno] = "Se ha eliminado correctamente al usuario"
        redirect_to users_url
      }
      format.json {
        head :no_content
      }
    end
  end

  def inicio
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:nombre, :email, :contra2, :rol, :almacene_id, :cargo_id, :unidade_id, :jefe)
  end
end
