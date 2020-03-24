class Song < ApplicationRecord
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :categories
  has_many :guesses
  has_many :games, through: :guesses

  scope :for_categories, -> (categories) { joins(:categories).where(categories: categories) }
end
