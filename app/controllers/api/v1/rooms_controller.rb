class Api::V1::RoomsController < ApplicationController

  def index
  end

  def show
    @room = Room.find_by(id: parmas[:id])
    render json: { room: RoomSerializer.new(@room)}
  end

  def create
  end

  def update
    byebug
    @room = Room.find_by(id: params[:id])
    @member = Member.find_by(id: params[:member_id])
    @room.members << @member
    render json: {room: RoomSerializer.new(@room)}
  end

  def destroy
  end

end
