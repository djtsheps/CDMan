class SearchController < ApplicationController
  def index
  	@albums = Album.where("LOWER(title) like LOWER(:title)",title: "%#{params[:query]}%")
    @albums_message = "#{@albums.count} album(s) found..."

    @tracks = Track.where("LOWER(title) like LOWER(:title)",title: "%#{params[:query]}%")                                                                                                                                                                                          
    @tracks_message = "#{@tracks.count} track(s) found..."

     @artists = Artist.where("LOWER(firstname) like LOWER(:query) OR LOWER(lastname) like LOWER(:query) OR LOWER(aka) like LOWER(:query)",query: "%#{params[:query]}%")
    @artists_message = "#{@artists.count} artist(s) found..."
  end
end
