class Track < ActiveRecord::Base
  has_many :tack_albums
  has_many :track_artists
  validates_presence_of :title, :artist_id, :album_id, :year, :genre
end
