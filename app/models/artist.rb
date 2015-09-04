class Artist < ActiveRecord::Base
  has_many :track_artists
  validates_presence_of :firstname, :lastname, :aka
end
