class AlbumTrack < ActiveRecord::Base
  belongs_to :track
  belongs_to :album
  validates_presence_of :track_id, :album_id
end
