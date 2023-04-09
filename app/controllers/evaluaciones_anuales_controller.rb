class EvaluacionesAnualesController < ApplicationController
  before_action :set_evaluaciones_anuale, only: %i[ show update destroy ]

  # GET /evaluaciones_anuales
  def index
    @evaluaciones_anuales = EvaluacionesAnuale.all

    render json: @evaluaciones_anuales
  end

  # GET /evaluaciones_anuales/1
  def show
    render json: @evaluaciones_anuale
  end

  # POST /evaluaciones_anuales
  def create
    @evaluaciones_anuale = EvaluacionesAnuale.new(evaluaciones_anuale_params)

    if @evaluaciones_anuale.save
      render json: @evaluaciones_anuale, status: :created, location: @evaluaciones_anuale
    else
      render json: @evaluaciones_anuale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evaluaciones_anuales/1
  def update
    if @evaluaciones_anuale.update(evaluaciones_anuale_params)
      render json: @evaluaciones_anuale
    else
      render json: @evaluaciones_anuale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evaluaciones_anuales/1
  def destroy
    @evaluaciones_anuale.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluaciones_anuale
      @evaluaciones_anuale = EvaluacionesAnuale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluaciones_anuale_params
      params.fetch(:evaluaciones_anuale, {})
    end
end
