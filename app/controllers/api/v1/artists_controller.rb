class Api::V1::ArtistsController <  Api::BaseController  
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /api/artists
  def index
    @artists = Artist.all
    
    render json: @artists
  end

  # GET /api/artists/1
  def show
    render json: @artist
  end

  # POST /api/artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render :show, status: :created, location: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/artists/1
  def update
    if @artist.update(artist_params)
      head :no_content
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

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
