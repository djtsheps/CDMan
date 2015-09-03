class Artist < ActiveRecord::Base
  has_many :track_artists
  has_many :track_albums
  validates_presence_of :firstname, :lastname, :aka
end
