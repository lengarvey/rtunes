class AddCoverToSong < ActiveRecord::Migration
  def change
    add_column :songs, :cover, :string
  end
end
