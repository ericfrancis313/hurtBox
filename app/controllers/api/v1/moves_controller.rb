class Api::V1::MovesController <ApplicationController
  def index
    @moves= Move.all
  end

  def show
    @moves = Move.find(params[:id])
    response = {move:@move}
    render json:response
  end

end
