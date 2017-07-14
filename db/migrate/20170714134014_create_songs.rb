class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :code
      t.references :artist, foreign_key: true
      t.string :title
      t.string :machine
      t.text :lyrics

      t.timestamps
    end
  end
end
