class CreateCategoriesGames < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_games do |t|
      t.belongs_to :game
      t.belongs_to :category
    end

    add_index :categories_games, [:game_id, :category_id], unique: true
  end
end
