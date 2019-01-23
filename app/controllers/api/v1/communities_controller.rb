class Api::V1::CommunitiesController < ApplicationController

  def index
  end

  def show
    @community = Community.find_by(id: params[:id])
    render json: {community: @community, rooms: @community.rooms, members: @community.members, user: @community.manager, roomusers: @community.roomusers}
  end

  def create
  rooms = params["community"]["roomamount"].to_i
  members = params["community"]["memberamount"].to_i

    @community = Community.new(community_params)
    @community.user = current_user
    @community.save
    rooms.times do
      @room = Room.new
      @room.community = @community
      @room.name = Faker::Zelda.location
      @room.occupancy = 1
      @room.save
    end

    members.times do
      @user = User.new
      @communityuser = Communityuser.new
      @communityuser.community = @community
      @user.username = "new member"
      @user.status = "newMember"
      @user.password = "1"
      @user.set_image
      @user.bio = "a happy member of #{@community.name}"
      @user.save
      @communityuser.user = @user
      @communityuser.save
    end

    puts "saved"
    render json: {community: @community, rooms: @community.rooms, members: @community.users}
  end

  def get_todos
    @community = Community.find_by(id: params[:id])
    todos = @community.todos.map {|todo| TodoSerializer.new(todo)}
    render json: {todos: todos}
  end

  def update
  end

  def destroy
  end

  private

  def community_params
    params.require(:community).permit(:name, :roomamount, :memberamount)
  end



end
