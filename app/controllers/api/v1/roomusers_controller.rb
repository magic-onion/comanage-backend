class Api::V1::RoomusersController < ApplicationController

  def create
    @room = Room.find_by(id: params[:roomuser][:roomId])
    @user = User.find_by(id: params[:roomuser][:memberId])
    @roomuser = Roomuser.new
    if @room.users.length < @room.occupancy && !@room.members.include?(@user) && !@user.rooms.include?(@room)
      @roomuser.user = @user
      @roomuser.room = @room
      @roomuser.save
      render json: {roomuser: @roomuser, room: RoomSerializer.new(@room), user: UserSerializer.new(@user), members: @room.members}
    else
      error = "Room is full"
      render json: {error: error}
    end
  end
end
