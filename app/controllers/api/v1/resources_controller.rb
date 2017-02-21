class Api::V1::ResourcesController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def fetch_meta(url)
    MetaInspector.new(url, read_timeout: 2).images.best
  end

  def generate_thumbnail(url)
    Cloudinary::Uploader.upload(url, responsive_breakpoints: {create_derived: true, max_width: 420})
  end

  def create
    @resource = Resource.new(resource_params)
    begin
      @img = fetch_meta(@resource.url)
    rescue MetaInspector::RequestError
      @img = "http://i.imgur.com/7o2uMsn.png"
    end
    unless @img === "http://i.imgur.com/7o2uMsn.png"
      @img = generate_thumbnail(@img)["responsive_breakpoints"][0]["breakpoints"][0]["url"]
    end
      @resource.image_url = @img

    if @resource.save
      render json: @resource.section.trail, include: {sections: [:resources]}
    end
  end

  private
  def resource_params
    params.require(:resource).permit(:section_id, :title, :url, :image_url, :notes)
  end
end
