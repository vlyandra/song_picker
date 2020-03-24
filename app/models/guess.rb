class Guess < ApplicationRecord
  belongs_to :song
  belongs_to :game

  CORRECT = 10
  SKIPPED = 20

  RESULTS = {
    CORRECT => "Correct",
    SKIPPED => "Skipped"
  }
end
