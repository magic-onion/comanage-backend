class Api::V1::RoomsController < ApplicationController

  def index
  end

  def show
    @room = Room.find_by(id: params[:id])
    render json: { room: RoomSerializer.new(@room)}
  end

  def create
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.update(room_params)
    render json: {room: RoomSerializer.new(@room)}
  end

  def destroy
  end

  private
  def room_params
    params.require(:room).permit(:name, :occupancy)
  end

end
