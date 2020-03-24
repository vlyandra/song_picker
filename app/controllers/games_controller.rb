class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.categories = Category.where("id in ?", params[:category_ids])
    @game.save
  end

  private

  def game_params
    params.require(:game).permit(:start, :end)
  end
end
