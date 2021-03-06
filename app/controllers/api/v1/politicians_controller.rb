require 'uri'
require 'net/http'
class Api::V1::PoliticiansController < ApplicationController
  before_action :set_politician, only: %i[ show update destroy ]

  # GET /politicians
  def index
    where = {}

    if params[:state_code]
      where["state.code"] = params[:state_code]
    end

    if params[:category]
      where["category"] = params[:category].to_i
    end

    if (where.empty?)
      @politicians = Politician.all
    else
      @politicians = Politician.joins(:state).where(where)
    end

    render json: @politicians
  end

  # GET /politicians/1
  def show
    @politician = Politician.joins(:state).find_by(id: params[:id])
    render json: @politician, serializer: PoliticianSerializer
  end

  # POST /politicians
  def create
    @politician = Politician.new(politician_params)

    if @politician.save
      render json: @politician, status: :created, location: @politician
    else
      render json: @politician.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /politicians/1
  def update
    if @politician.update(politician_params)
      render json: @politician
    else
      render json: @politician.errors, status: :unprocessable_entity
    end
  end

  # DELETE /politicians/1
  def destroy
    @politician.destroy
  end

  # GET /politicians/search
  def search
    @politicians = Politician.joins(:state).where(
      'UNACCENT(politicians.name) ILIKE UNACCENT(?)', 
      "%#{params[:text]}%").first(5)

    render json: @politicians
  end


  # GET /politicians/image
  def image
    if params[:image_id]
      img_url = "http://www.sil.gobernacion.gob.mx/Archivos/Fotos/#{params[:image_id]}.jpg"
      url = URI.parse(img_url)
      response = Net::HTTP.get_response(url)
      send_data Base64.encode64(response.read_body), type: 'image/jpeg', disposition: 'inline'
    else
      render :status => 404
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      @politician = Politician.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def politician_params
      params.require(:politician).permit(:name, :email, :legislature, :active, :party, :birth_date, :telephone, :photo_url, :legislative_experience, :swearing_date, :academic_preparation, :location, :last_degree_of_studies, :district, :city, :relative_majority, :type, :social_links)
    end
end
