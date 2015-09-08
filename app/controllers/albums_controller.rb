class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]

  # GET /albums/1
  # GET /albums/1.json
  def show
    @tracks = @album.tracks
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
      @albums = [@album]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :year)
    end
end
