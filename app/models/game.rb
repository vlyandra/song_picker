class Game < ApplicationRecord
  has_many :guesses
  has_many :songs, through: :guesses
  has_and_belongs_to_many :categories

  def pick_song
    Song.for_categories(categories).where.not(id: songs).order("RANDOM()").first
  end
end
