class TracksController < ApplicationController
  before_action :set_track, only: [:show]


  # GET /tracks/1
  # GET /tracks/1.json
  def show
    @albums = @track.albums
    @artists = @track.artists
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
      @tracks = [@track]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :year, :genre, :number)
    end
end
