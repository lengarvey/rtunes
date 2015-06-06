class AddHashToSong < ActiveRecord::Migration
  def change
    add_column :songs, :md5hash, :string
  end
end
