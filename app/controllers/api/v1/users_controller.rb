class Api::V1::UsersController < ActionController::Base
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(params[:id])
    render json: @user
  end
end
