class GuessesController < ApplicationController
  def new
    @guess = Guess.new
    @game = Game.find(params[:game_id])
    @song = @game.pick_song
  end

  def create
    @guess = Guess.create(guess_params)
  end

  def update
    @guess = Guess.find(params[:id])
    @guess.update(guess_params)
  end

  private

  def guess_params
    params.require(:guess).permit(:song_id, :game_id, :result)
  end
end
