class Api::V1::RoommembersController < ApplicationController

  def index
  end

  def show
  end

  def create
    @room = Room.find_by(id: params[:roomId])
    @member = Member.find_by(id: params[:memberId])
    @roommember = Roommember.new
    if @room.members.length < @room.occupancy
      @roommember.member = @member
      @roommember.room = @room
      @roommember.save
      render json: @roommember
    else
      error = "Room is full"
      render json: {error: error}
    end
  end

  def update

  end

  def destroy
  end

end
