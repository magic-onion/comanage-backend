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
    @user = User.find_by(id: params[:id])
    render json: {user: UserSerializer.new(@user)}
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

  def add_member
    @user = User.new
    @community = Community.find_by(id: params[:user][:communityId])
    @communityuser = Communityuser.new
    @communityuser.community = @community
    @user.username = params[:user][:username]
    @user.status = "newMember"
    @user.password = params[:user][:username]
    @user.save
    @communityuser.user = @user
    @communityuser.save
    render json: {user: @user, community: @community, members: @community.members}
  end

  def user_rooms
    @user.find_by(id: params[:id])
    render json: @user.rooms
  end

  def member_data
    @user = User.find_by(id: params[:id])
    communities = @user.member_community.map {|community| CommunitySerializer.new(community)}
    render json: {user: @user, community: communities}
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.username = params[:user][:username]
    @user.password = params[:user][:username]
    @user.save
    render json: {user: UserSerializer.new(@user)}
  end

  def authorize_member
    @user = User.find_by(id: params[:id])
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    @user.status = "member"
    @user.save
    render json: {user: UserSerializer.new(@user)}
  end

  def destroy

  end

  def show_members
    @room = Room.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :status)
  end

  def member_params
    params.require(:user).permit(:username, :password, :status, :communityId)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
