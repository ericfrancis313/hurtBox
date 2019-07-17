class Api::V1::CharactersController < ApplicationController

  def show
    @character = Character.find(params[:id])
    @moves = Character.moves
    response = {character:@character}
    render json:response
  end
end
