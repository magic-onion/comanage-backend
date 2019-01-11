  class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    before_action :find_user, only: [:show, :update, :destroy]


  def index
    @users = User.all
    render json: @users
  end

  def profile
    @user = current_user
    @communities = current_user.communities.map {|comm| CommunitySerializer.new(comm)}
    current_user.communities.first ? profile_community = current_user.communities.first : profile_community = nil
    profile_community ? profile_rooms = profile_community.rooms : profile_rooms = nil
    profile_community ? profile_members = profile_community.members : profile_members = nil
    render json: { user: @user, communities: @communities }, status: :accepted
  end

  def show
    @user = User.find_by(params[:id])
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
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
