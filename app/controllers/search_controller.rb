class SearchController < ApplicationController
  def index
  	@artists = @albums = @tracks = []

    if params[:query]
      if params[:query].length < 3
       flash.now[:error] = "Please enter a more specific search query... (at least 3 characters)"
      else
        @albums = Album.where("LOWER(title) like LOWER(:title)",title: "%#{params[:query]}%")
    	@tracks = Track.where("LOWER(title) like LOWER(:title)",title: "%#{params[:query]}%")
    	@artists = Artist.where("LOWER(firstname) like LOWER(:query) OR LOWER(lastname) like LOWER(:query) OR LOWER(aka) like LOWER(:query)",query: "%#{params[:query]}%")
      end
    end
    @tracks_message = "#{@tracks.count} track(s) found..."
    @artists_message = "#{@artists.count} artist(s) found..."
    @albums_message = "#{@albums.count} album(s) found..."
  end
end
