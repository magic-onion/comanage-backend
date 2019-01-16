class RoomusersController < ApplicationController

  def create
    @room = Room.find_by(id: params[:roomMember][:roomId])
    @user = User.find_by(id: params[:roomMember][:userId])
    @roomuser = Roommember.new
    if @room.users.length < @room.occupancy && !@room.members.include?(@user) && !@user.rooms.include?(@room)
      @roomuser.member = @member
      @roomuser.room = @room
      @roomuser.save
      render json: @roomuser
    else
      error = "Room is full"
      render json: {error: error}
    end
  end
end
