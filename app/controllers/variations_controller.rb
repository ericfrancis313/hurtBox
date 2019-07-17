class VariationsController < ApplicationController

  def index
    @variations = Variation.all
  end

  def show
    @variation = Variation.find(params[:id])
    @move = Move.find(params[:id])
  end
end
