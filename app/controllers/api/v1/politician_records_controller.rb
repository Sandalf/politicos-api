class Api::V1::PoliticianRecordsController < ApplicationController
  before_action :set_politician_record, only: %i[ show update destroy ]

  # GET /politician_records
  def index
    @politician_records = PoliticianRecord.all

    render json: @politician_records
  end

  # GET /politician_records/1
  def show
    render json: @politician_record
  end

  # POST /politician_records
  def create
    @politician_record = PoliticianRecord.new(politician_record_params)

    if @politician_record.save
      render json: @politician_record, status: :created, location: @politician_record
    else
      render json: @politician_record.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /politician_records/1
  def update
    if @politician_record.update(politician_record_params)
      render json: @politician_record
    else
      render json: @politician_record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /politician_records/1
  def destroy
    @politician_record.destroy
  end

  # GET /politician_records/committee_history?politician_id=1
  def committee_history
    @politician_records = PoliticianRecord.where(politician_id: params[:politician_id], category: 1)
    render json: @politician_records
  end

  # GET /politician_records/administrative_history?politician_id=1
  def administrative_history
    @politician_records = PoliticianRecord.where(politician_id: params[:politician_id], category: 2)
    render json: @politician_records
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician_record
      @politician_record = PoliticianRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def politician_record_params
      params.require(:politician_record).permit(:start_date, :end_date, :description, :type)
    end
end
