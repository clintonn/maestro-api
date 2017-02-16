class Api::V1::SectionsController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create
    @section = Section.new(section_params)
    @section.trail
    if @section.save
      render json: @section.trail, include: {sections: [:resources]}
    end
  end

  private
  def section_params
    params.require(:section).permit(:trail_id, :title)
  end

end
