class CreateTrackAlbums < ActiveRecord::Migration
  def change
    create_table :track_albums do |t|
      t.integer :track_id
      t.integer :album_id

      t.timestamps null: false
    end
  end
end
