class CreateGuesses < ActiveRecord::Migration[6.0]
  def change
    create_table :guesses do |t|
      t.belongs_to :song
      t.belongs_to :game
      t.integer :result
    end
  end
end
