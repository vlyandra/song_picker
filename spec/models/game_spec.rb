require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "#song_picker" do
    let(:game) { Game.create }
    let(:category) { create(:category)}
    let(:songs) { [1..5].map { create(:song) } }

    before do
      category.songs = songs
      category.save!

      game.categories << category
      game.save!
    end

    it "picks a song" do
      expect(songs.include?(game.pick_song)).to eq(true)
    end

    it "does not pick a duplicate song" do
      songs[1..-1].each do |song|
        game.guesses.create!(song: song)
      end

      expect(game.pick_song).to eq(songs[0])
    end
  end
end
