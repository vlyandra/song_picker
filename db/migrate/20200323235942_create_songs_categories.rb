class CreateSongsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :songs_categories do |t|
      t.belongs_to :song
      t.belongs_to :category
    end
  end
end
