class ClienteProveedorsController < ApplicationController
  before_action :set_cliente_proveedor, only: %i[ show update destroy ]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente_proveedor
      @cliente_proveedor = ClienteProveedor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_proveedor_params
      params.fetch(:cliente_proveedor, {})
    end
end
