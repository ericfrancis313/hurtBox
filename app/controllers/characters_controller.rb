class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @variation = Variation.find(params[:id])
    @move = Move.find(params[:id])
  end
end
