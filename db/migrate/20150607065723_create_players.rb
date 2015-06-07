class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.boolean :playing, default: false, null: false
      t.references :song, index: true
      t.boolean :requested, default: false, null: false

      t.timestamps null: false
    end
    add_foreign_key :players, :songs
  end
end
