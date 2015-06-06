class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :file
      t.boolean :processed, default: false

      t.timestamps null: false
    end
  end
end
