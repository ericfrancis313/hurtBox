class Api::V1::CharactersController < ApplicationController
  def show
    @character = Character.find(params[:id])
    response = {character:@character}
    render json:response
  end
end
