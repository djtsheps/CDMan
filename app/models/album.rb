class Album < ActiveRecord::Base
  has_many :album_tracks
  has_many :tracks, :through => :album_tracks
  has_many :artists, :through => :track_artists
  validates_presence_of :title, :year
end
