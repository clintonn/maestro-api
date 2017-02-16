class Api::V1::ResourcesController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      render json: @resource.section.trail, include: {sections: [:resources]}
    end
  end

  private
  def resource_params
    params.require(:resource).permit(:section_id, :title, :url)
  end
end
