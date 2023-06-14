class UpwardFbksController < ApplicationController
  before_action :set_upward_fbk, only: %i[ show update destroy ]
  before_action :authorize_request
  require 'csv'
  # GET /upward_fbks
  def index
    @upward_fbks = UpwardFbk.all

    render json: @upward_fbks
  end

  # GET /upward_fbks/1
  def show
    render json: @upward_fbk
  end

  # POST /upward_fbks
  def create
    @upward_fbk = UpwardFbk.new(upward_fbk_params)

    if @upward_fbk.save
      render json: @upward_fbk, status: :created, location: @upward_fbk
    else
      render json: @upward_fbk.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /upward_fbks/1
  def update
    if @upward_fbk.update(upward_fbk_params)
      render json: @upward_fbk
    else
      render json: @upward_fbk.errors, status: :unprocessable_entity
    end
  end

  # DELETE /upward_fbks/1
  def destroy
    @upward_fbk.destroy
  end

  def batch_upload
    file_path = params[:file].path
    data = CSV.parse(File.read(file_path), headers: true)
    fbks = []
    data.each do |row|
      fbks <<
      {
        user_id: User.find_by(email: row["email"]).id,
        promedio: row["promedio"],
        comments: row["comentarios"]
      }
    end
    
    if UpwardFbk.upsert_all(fbks)
      render json: {message: "Upward feedbacks uploaded successfully"}, status: :ok
    else
      render json: {message: "Upward feedbacks upload failed"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upward_fbk
      @upward_fbk = UpwardFbk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upward_fbk_params
      # params.fetch(:upward_fbk, {})
      params.require(:upward_fbk).permit(:user_id, :promedio, :comments)
    end
end
