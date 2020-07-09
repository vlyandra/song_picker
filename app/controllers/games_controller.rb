class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.create!(game_params)
    render "guesses/new", game: @game
  end

  private

  def game_params
    params.require(:game).permit(:start, :end, categories: [:name, :id])
  end
end
