class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :firstname
      t.string :lastname
      t.string :aka

      t.timestamps null: false
    end
  end
end
