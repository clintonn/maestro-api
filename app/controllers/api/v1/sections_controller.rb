class Api::V1::SectionsController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create
    @section = Trail.new(section_params)
    if @section.save
      render json: @section
    end
  end

  private
  def trail_params
    params.require(:section).permit(:trail_id, :name)
  end

end
