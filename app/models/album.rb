class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :album_tracks
  has_many :tracks, :through => :album_tracks
  has_many :artists, :through => :track_artists
  validates_presence_of :title, :artist_id, :year
end
