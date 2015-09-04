class Track < ActiveRecord::Base
  has_many :album_tracks
  has_many :albums, :through => :album_tracks
  has_many :track_artists
  validates_presence_of :title, :artist_id, :year, :genre
end
