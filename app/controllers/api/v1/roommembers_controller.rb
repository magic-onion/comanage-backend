class Api::V1::RoommembersController < ApplicationController

  def index
  end

  def show
  end

  def create
    starting = Date.parse(params[:startDate].to_s)
    ending = Date.parse(params[:endDate].to_s)
    @room = Room.find_by(id: params[:roomId])
    @member = Member.find_by(id: params[:memberId])
    @roommember = Roommember.new
    @roommember.member = @member
    @roommember.room = @room
    @roommember.start_date = starting
    @roommember.end_date = ending
    @roommember.end_date > Time.now ? @roommember.active = true : @roommember.active = false
    @roommember.save
    render json: @roommember
  end

  def update

  end

  def destroy
  end

end
