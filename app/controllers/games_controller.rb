class GamesController < ApplicationController

  def index
    @games = Game.all
  end


  def show
    @game = Game.find(params[:id])
    @characters = @game.characters
  end

  def new
    @game=Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "game created successfully"
      redirect_to @game
    else
      flash.now[:error] = @game.errors.full_messages.join(", ")
      render action: :new
    end
  end

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
