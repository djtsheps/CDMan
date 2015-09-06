class Track < ActiveRecord::Base
  has_many :album_tracks
  has_many :albums, :through => :album_tracks
  has_many :track_artists
  has_many :artists, :through => :track_artists
  validates_presence_of :title, :year, :genre, :number
end
