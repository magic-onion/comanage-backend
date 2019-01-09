  class Api::V1::UsersController < ActionController::Base
    before_Action :find_user, only: [:show, :update, :destroy]


  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(params[:id])
    render json: @user
  end

  def create

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
