class Api::V1::TracksController <  Api::BaseController  
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  # GET /api/tracks
  def index
    @tracks = Track.all

    render json: @tracks
  end

  # GET /api/tracks/1
  def show
    render json: @track
  end

  # POST /api/tracks
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        render :show, status: :created, location: @track
      else
        render json: @track.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /api/tracks/1
  def update
    if @track.update(track_params)
      head :no_content
    else
      render json: @track.errors, status: :unprocessable_entity
    end
  end

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
      params.require(:track).permit(:title, :year, :genre)
    end
end
