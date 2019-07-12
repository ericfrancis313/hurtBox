class GamesController < ApplicationController

  def index
    @games = Game.all
  end


  def show
    @game = Game.find(params[:id])
    @characters = @game.characters
  end
end
