class Api::V1::TrailsController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create
    @trail = Trail.new(trail_params)
    if @trail.save
      render json: @trail
    end
  end

  private
  def trail_params
    params.require(:trail).permit(:title, :description)
  end

end
