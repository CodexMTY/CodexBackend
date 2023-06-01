class UsersController < ApplicationController
  require 'csv'
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    inactive = params[:inactivos]
    if inactive == "true"
      @users = User.all
    else 
      @users = User.where(status: "activo")
    end

    serializedUsers = []
    @users.each do |user|
      user_serializer = UserSerializer.new(user: user)
      serializedUsers << user_serializer.serialize_user(user)
    end

    render json: serializedUsers
  end

  # GET /users/1
  def show
    user_serializer = UserSerializer.new(user: @user)
    user = user_serializer.serialize_user(@user)
    render json: user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user.update(status: "inactivo")
      render json: {message: "User deleted successfully"}, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def batch_upload
    file_path = params[:file].path
    data = CSV.parse(File.read(file_path), headers: true)
    users = []
    data.each do |row|
      users <<
      {
        nombre: row["nombre"],
        apellidos: row["apellidos"],
        email: row["email"],
        password_digest: BCrypt::Password.create("temppwd1234"),
        idm4: row["idm4"],
        cumpleanos: row["cumpleanos"],
        fecha_ingreso: row["fecha_ingreso"],
        universidad: row["universidad"],
        direccion: row["direccion"],
        puesto: row["puesto"],
        pc_cat: row["pc_cat"],
        resumen: row["resumen"],
        key_talent: row["key_talent"],
        encuadre: row["encuadre"],
        cet: row["cet"],
        estructura3: row["estructura3"],
        estructura4: row["estructura4"],
        estructura5: row["estructura5"]
      }
    end

    if User.insert_all(users)
      render json: {message: "Users uploaded successfully"}, status: :ok
    else
      render json: {message: "Users upload failed"}, status: :unprocessable_entity
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.fetch(:user, {})
      params.permit(:nombre, :email, :password, :password_confirmation, :apellidos, :idm4, :cumpleanos, :fecha_ingreso, :universidad, :direccion, :puesto, :pc_cat, :resumen, :key_talent, :encuadre, :cet, :estructura3, :estructura4, :estructura5, :jefe, :image, :estudios => [])
    end
end
