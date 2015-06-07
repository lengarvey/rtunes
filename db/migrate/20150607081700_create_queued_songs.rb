class CreateQueuedSongs < ActiveRecord::Migration
  def change
    create_table :queued_songs do |t|
      t.references :song, index: true

      t.timestamps null: false
    end
    add_foreign_key :queued_songs, :songs
  end
end
