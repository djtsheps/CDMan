class Api::V1::TracksController <  Api::BaseController  
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def_param_group :id do
    param :id, :number, "Track id", :required => true
  end

  def_param_group :track_details do
    param :title, String, "Track title"
    param :year, :number, "Year in which track was produced"
    param :genre, String, "Track genre"
    param :number, :number, "Track number"
  end

  def_param_group :required_track_details do
    param :track,  Hash do
      param :title, String, "Track title", :required => true
      param :year, :number, "Year in which track was produced", :required => true
      param :genre, String, "Track genre", :required => true
      param :number, :number, "Track number", :required => true
    end
  end

 def_param_group :create_with_album_and_artist do
    param :track, Hash do
      param :title, String, "Track title", :required => true
      param :year, :number, "Year in which track was produced", :required => true
      param :genre, String, "Track genre", :required => true
      param :number, :number, "Track number", :required => true
    end
    param :album_ids, String, "Album id(s) .e.g 1,2... ", :required => true
    param :artist_ids, String, "Artist id(s) .e.g 3,4,5...", :required => true
end

  resource_description do
    short 'Site Tracks'
    formats ['json']
    error 404, "Record Not Found"
    error 422, "Unprocessable Entity"
  end

  api :GET, '/search/tracks', "Get all tracks filtered by search parameters"
  param :title, String, "Track title"
  # GET /api/tracks/search
  def search
    @tracks = Track.where("title like :title",title: "%#{params[:title]}%")
    
    render json: @albums
  end

  api :GET, '/tracks', "Get all tracks"
  # GET /api/tracks
  def index
    @tracks = Track.all

    render json: @tracks
  end

  api :GET, "/tracks/:id", "Show track details by :id"
  param_group :id
  # GET /api/tracks/1
  def show
    render json: @track
  end

  api :POST, "/tracks", "Create a track"
  param_group :required_track_details
  # POST /api/tracks
  def create
    @track = Track.new(track_params)

    if @track.save
      render json: @track, status: :created
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  api :POST, "/albums/:album_ids/artists/:artist_ids/tracks", "Create a track linked to both an artist and album"
  param_group :create_with_album_and_artist
  # POST /albums/:album_ids/artists/:artist_ids/tracks
  def create_with_album_and_artist
    @track = Track.new(track_params)
    @artists = find_artists(params[:artist_ids])
    @albums = find_albums(params[:album_ids])

    @track.artists << @artists
    @track.albums << @albums

    if @track.errors.count != 0 || !@track.save
      render json: @track.errors, status: :unprocessable_entity
    else 
      render json: @track, status: :created
    end
  end

  api :PUT, "/tracks/:id", "Update track details"
  param_group :id
  param_group :track_details
  # PATCH/PUT /api/tracks/1
  def update
    if @track.update(track_params)
      head :no_content
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/tracks/:id", "Delete track by :id"
  param_group :id
  # DELETE /api/tracks/1
  def destroy
    @track.destroy

    head :no_content 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      begin
        @track = Track.find(params[:id])
      rescue ActiveRecord::RecordNotFound  => e
         render :json => {error: 'record not found'}, status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :year, :genre, :number)
    end

    # Lookup album ids
    def find_albums album_ids
      begin
        ids = album_ids.split(/,/)
        found_albums = Album.where(id: ids)

        if found_albums.count == 0
          @track.errors.add(:album_ids, "no album(s) found")
        end

        return found_albums
      rescue Exception  => e
        @track.errors.add(:album_ids, e)
        return found_albums
      end
    end

    # Lookup artist ids
    def find_artists artist_ids
      begin
        ids = artist_ids.split(/,/)
        found_artists = Artist.where(id: ids)

        if found_artists.count == 0
          @track.errors.add(:artist_ids, "no artist(s) found")
        end

        return found_artists
      rescue Exception  => e
         @track.errors.add(:artist_ids, e)
         return found_artists
      end
    end
end
