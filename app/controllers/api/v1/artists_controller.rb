class Api::V1::ArtistsController <  Api::BaseController  
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def_param_group :id do
    param :id, :number, "Artist id", :required => true
  end

  def_param_group :artist_details do
    param :artist, Hash do
      param :lastname, String, "Artist lastname"
      param :firstname, String, "Artist firstname"
      param :aka, String, "Artist alias (Also Known As)"
    end
  end

  def_param_group :required_artist_details do
    param :artist, Hash do
      param :lastname, String, "Artist lastname", :required => true
      param :firstname, String, "Artist firstname", :required => true
      param :aka, String, "Artist alias (Also Known As)", :required => true
    end
  end

  resource_description do
    short 'Site Artists'
    formats ['json']
    error 404, "Record Not Found"
    error 422, "Unprocessable Entity"
  end

  api :GET, '/search/artists', "Get all artists filtered by search parameters"
  param :firstname, String, "Artist firstname"
  param :lastname, String, "Artist lastname"
  # GET /api/search/artists
  def search
    @artists = Artist.where("firstname like :firstname AND lastname like :lastname AND aka like :aka",firstname: "%#{params[:firstname]}%",lastname: "%#{params[:lastname]}%",aka: "%#{params[:aka]}%")
    
    render json: @artists
  end

  api :GET, '/artists', "Get all artists"
  # GET /api/artists
  def index
    @artists = Artist.all
    
    render json: @artists
  end

  api :GET, "/artists/:id", "Show artist details by :id"
  param_group :id
  # GET /api/artists/1
  def show
    render json: @artist
  end

  api :POST, "/artists", "Create an artist"
  param_group :required_artist_details
  # POST /api/artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render json: @artist, status: :created
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  api :PUT, "/artists/:id", "Update artist details"
  param_group :id
  param_group :artist_details
  # PATCH/PUT /api/artists/1
  def update
    if @artist.update(artist_params)
      head :no_content
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/artists/:id", "Delete artist by :id"
  param_group :id
  # DELETE /api/artists/1
  def destroy
    @artist.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      begin
        @artist = Artist.find(params[:id])
      rescue ActiveRecord::RecordNotFound  => e
        render :json => {error: 'record not found'}, status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:firstname, :lastname, :aka)
    end
end
