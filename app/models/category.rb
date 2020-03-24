class Category < ApplicationRecord
  has_and_belongs_to_many :songs
  has_and_belongs_to_many :games
end
