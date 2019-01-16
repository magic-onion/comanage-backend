class Api::V1::MembersController < ApplicationController
  # skip_before_action :authorized, only: [:show_rooms], raise: false
  def index
  end

  def show
    @member = Member.find_by(id: params[:id])
    render json: {member: MemberSerializer.new(@member)}
  end

  def create
    communityId = params[:member][:communityId].to_i
    @community = Community.find_by(id: params[:member][:communityId].to_i)
    @member = Member.new
    @member.name = params[:member][:name]
    @member.bio = params[:member][:bio]
    @community.members << @member
    @member.save
    render json: {member: MemberSerializer.new(@member), community: CommunitySerializer.new(@community)}
  end

  def update
    @member = Member.find_by(id: params[:id])
    @member.update(member_params)
    render json: {member: MemberSerializer.new(@member) }
  end

  def destroy
  end

  def show_rooms
    @member = Member.find_by(id: params[:id])
    render json: {rooms: @member.rooms, roomMembers: @member.roommembers}
  end

  def assign_member_to_room

  end

  private
  def member_params
    params.require(:member).permit(:name, :bio, :birthday, :status, :assigned, :communityId)
  end

end
