class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.text :description
      t.integer :genre_id
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :tracks, :users
    add_index :tracks, [:user_id, :created_at, :genre_id]
  end
end
