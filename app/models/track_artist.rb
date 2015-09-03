class TrackArtist < ActiveRecord::Base
  belongs_to :track
  belongs_to :artist
  validates_presence_of :track_id, :artist_id
end
