  class Api::V1::UsersController < ActionController::Base
    before_action :find_user, only: [:show, :update, :destroy]


  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(params[:id])
    render json: @user
  end

  def create
    byebug
    @user = User.create(user_params)
    render json: @user
  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :status)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
