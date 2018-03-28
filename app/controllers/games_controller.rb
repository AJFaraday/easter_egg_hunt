class GamesController < ApplicationController

  def index
    #HTML only
  end

  def egg
    #plain text only
  end

  def create
    game = Game.generate
    render json: {game_id: game.game_id}
  end

  def guess
    game = Game.where(game_id: params[:game_id]).first
    render json: game.guess(params[:x].to_i, params[:y].to_i)
  end

end
