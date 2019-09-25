class UserController < ApplicationController
  before_action :authorize_user

  def show
    @user = User.find(params[:id])
  end

  private
  def authorize_user
    if !user_signed_in? || currecnt_user.admin?
      raise ApplicationController::RoutingError.new("Not Found")
    end
  end

end
