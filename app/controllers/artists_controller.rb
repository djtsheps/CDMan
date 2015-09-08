class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  # GET /artists/1
  # GET /artists/1.json
  def show
    @tracks = @artist.tracks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
      @artists = [@artist]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:firstname, :lastname, :aka)
    end
end
