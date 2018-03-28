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
    result = game.guess(params[:x].to_i, params[:y].to_i)
    if game.completed
      result[:url] = 'http://easter_egg_hunt.andrewfaraday.com/surprise'
      result[:turns] = game.turns
    end
    render json: result
  end

  def stats
    @count = Game.count
    @max = Game.maximum(:turns)
    @min = Game.minimum(:turns)
  end

end
