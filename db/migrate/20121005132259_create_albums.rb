class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
    end

    add_index :albums, :user_id
  end
end
