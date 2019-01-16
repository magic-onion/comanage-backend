class Api::V1::RoomsController < ApplicationController

  def index
  end

  def show
    @room = Room.find_by(id: params[:id])
    render json: { room: RoomSerializer.new(@room)}
  end

  def create
    puts params
    @room = Room.create(room_params)
    # @room.name = params[:room][:name]
    @community = Community.find_by(id: params[:room][:communityId].to_i)
    @community.rooms << @room
    render json: {room: RoomSerializer.new(@room), community: CommunitySerializer.new(@community)}
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
