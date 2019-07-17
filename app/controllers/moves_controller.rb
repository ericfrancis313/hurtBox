class MovesController < ApplicationController

  def index
    @moves = Move.all
  end

  def show
    @moves = Move.find(params[:id])
  end
end
