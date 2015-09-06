class RemoveArtistIdFromTrack < ActiveRecord::Migration
  def change
    remove_column :tracks, :artist_id, :integer
  end
end
