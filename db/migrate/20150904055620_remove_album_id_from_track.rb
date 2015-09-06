class RemoveAlbumIdFromTrack < ActiveRecord::Migration
  def change
    remove_column :tracks, :album_id, :integer
  end
end
