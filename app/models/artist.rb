class Artist < ActiveRecord::Base
  has_many :track_artists
  has_many :tracks, :through => :track_artists
  validates_presence_of :firstname, :lastname, :aka
  validates_uniqueness_of :aka, :scope => [:firstname,:lastname], :message => '%{value} exists already !!'
end
