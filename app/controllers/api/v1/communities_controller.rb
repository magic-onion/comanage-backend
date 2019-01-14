class Api::V1::CommunitiesController < ApplicationController

  def index
  end

  def show
    @community = Community.find_by(id: params[:id])
    render json: {community: CommunitySerializer.new(@community)}
  end

  def create
  rooms = params["community"]["roomamount"].to_i
  members = params["community"]["memberamount"].to_i
  puts rooms.class

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
      @member = Member.new
      @member.community = @community
      @member.name = Faker::Seinfeld.character
      @member.bio = Faker::Overwatch.quote
      @member.save
    end



    puts "saved"
    render json: {community: @community, rooms: @community.rooms, members: @community.members}
  end

  def update
  end

  def destroy
  end

  private

  def community_params
    params.require(:community).permit(:name, :start_date)
  end



end
