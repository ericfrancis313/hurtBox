class Api::V1::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @character=@game.characters
    response = {game:@game}
    render json: response
  end

end
