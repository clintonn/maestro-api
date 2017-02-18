class Api::V1::ResourcesController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create
    @resource = Resource.new(resource_params)
    @img = MetaInspector.new(@resource.url, timeout: 2).images.best
    @img = Cloudinary::Uploader.upload(@img, max_width: 200)["url"]
    @resource.image_url = @image

    if @resource.save
      render json: @resource.section.trail, include: {sections: [:resources]}
    end
  end

  private
  def resource_params
    params.require(:resource).permit(:section_id, :title, :url, :image_url)
  end
end
