class GamesController < ApplicationController

  def index
    @games = Game.all
    @character = Character.all
  end


  def show
    @game = Game.find(params[:id])
    @characters = Game.find(params[:id]).characters
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

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
