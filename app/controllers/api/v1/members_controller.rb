class Api::V1::MembersController < ApplicationController
  # skip_before_action :authorized, only: [:show_rooms], raise: false
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show_rooms
    @member = Member.find_by(id: params[:id])
    render json: {rooms: @member.rooms}
  end

end
