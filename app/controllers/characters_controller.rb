class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @variation = Variation.find(params[:id])
    @move = Move.find(params[:id])
  end

  def new
    @character=Character.new
    @games=Game.all
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      flash[:notice] = "character created successfully"
      redirect_to @character
    else
      flash.now[:error] = @character.errors.full_messages.join(", ")
      render action: :new
    end
  end

  private
  def character_params
    params.require(:character).permit(:name)
    
  end
end
