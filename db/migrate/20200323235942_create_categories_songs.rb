class CreateCategoriesSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_songs do |t|
      t.belongs_to :song
      t.belongs_to :category
    end

    add_index :categories_songs, [:song_id, :category_id], unique: true
  end
end
