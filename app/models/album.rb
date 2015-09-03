class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks, :through => :track_albums
  has_many :artists, :through => :track_artists
  validates_presence_of :title, :artist_id, :year
end
