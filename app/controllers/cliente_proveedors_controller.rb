class ClienteProveedorsController < ApplicationController
  before_action :set_cliente_proveedor, only: %i[ show update destroy ]
  before_action :authorize_request
  require 'csv'
  # GET /cliente_proveedors
  def index
    @cliente_proveedors = ClienteProveedor.all

    render json: @cliente_proveedors
  end

  # GET /cliente_proveedors/1
  def show
    render json: @cliente_proveedor
  end

  # POST /cliente_proveedors
  def create
    @cliente_proveedor = ClienteProveedor.new(cliente_proveedor_params)

    if @cliente_proveedor.save
      render json: @cliente_proveedor, status: :created, location: @cliente_proveedor
    else
      render json: @cliente_proveedor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cliente_proveedors/1
  def update
    if @cliente_proveedor.update(cliente_proveedor_params)
      render json: @cliente_proveedor
    else
      render json: @cliente_proveedor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cliente_proveedors/1
  def destroy
    @cliente_proveedor.destroy
  end

  def batch_upload
    file_path = params[:file].path
    data = CSV.parse(File.read(file_path), headers: true)
    cliente_provs = []
    data.each do |row|
      cliente_provs <<
      {
        user_id: User.find_by(email: row["email"]).id,
        promedio: row["promedio"],
        comentarios: row["comentarios"]
      }
    end
    
    if ClienteProveedor.upsert_all(cliente_provs)
      render json: {message: "Cliente proveedors uploaded successfully"}, status: :ok
    else
      render json: {message: "Cliente proveedors upload failed"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente_proveedor
      @cliente_proveedor = ClienteProveedor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_proveedor_params
      # params.fetch(:cliente_proveedor, {})
      params.require(:cliente_proveedor).permit(:user_id, :promedio, :comentarios)
    end
end
