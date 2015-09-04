class AlbumTrack < ActiveRecord::Base
  belongs_to :track
  belongs_to :album
end
