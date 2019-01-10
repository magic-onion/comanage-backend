class Api::V1::CommunitiesController < ApplicationController

  def index
  end

  def show
  end

  def create
    @community = Community.create(community_params)
    @community.user = User.first
    @community.save
    puts "saved"
    render json: @community
  end

  def update
  end

  def destroy
  end

  private

  def community_params
    puts params
    # params["community"]["rooms"] = params["community"]["rooms"].to_i
    # params["community"]["members"] = params["community"]["members"].to_i

    params.require(:community).permit(:name, :start_date)
  end



end
