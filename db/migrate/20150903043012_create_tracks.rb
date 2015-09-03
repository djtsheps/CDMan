class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :artist_id
      t.integer :album_id
      t.integer :year
      t.string :genre

      t.timestamps null: false
    end
  end
end
