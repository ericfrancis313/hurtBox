class Api::V1::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    response = {game:@game}
    render json: response 
  end

end
