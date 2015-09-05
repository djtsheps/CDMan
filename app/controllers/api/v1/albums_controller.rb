class Api::V1::AlbumsController < Api::BaseController  
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def_param_group :id do
    param :id, :number, "Album id", :required => true
  end

  resource_description do
    short 'Site Albums'
    formats ['json']
    error 404, "Record Not Found"
  end

  api :GET, '/albums', "Get all albums"
  # GET /api/albums
  def index
    @albums = Album.all
    
    render json: @albums
  end

  api :GET, "/albums/:id", "Show album details by :id"
  param_group :id
  # GET /api/albums/1
  def show
    render json: @album
  end

  api :POST, "/albums", "Create an album"
  # POST /api/albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: :created, location: @album
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  api :PUT, "/albums/:id", "Update album details"
  param_group :id
  # PATCH/PUT /api/albums/1
  def update
    if @album.update(album_params)
      head :no_content
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/albums/:id", "Delete album by :id"
  param_group :id
  # DELETE /api/albums/1
  def destroy
    @album.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      begin
        @album = Album.find(params[:id])
      rescue ActiveRecord::RecordNotFound  => e
         render :json => {error: 'record not found'}, status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :year)
    end
end
