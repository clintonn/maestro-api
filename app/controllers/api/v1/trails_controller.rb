class Api::V1::TrailsController < Api::V1::ApplicationController

  before_action :authenticate_user, only: [:create, :index]

  def index
    @user = User.find(params[:user_id])
    @trails = @user.followed_trails
    if @trails
      render json: @trails, include: [:author, sections: [:resources]]
    else
      render json: {
        errors: ["Trails not found"],
        status: 404
      }
    end
  end

  def show
    @trail = Trail.find(params[:id])
    if @trail
      render json: @trail, include: [:author, sections: [:resources]]
    else
      render json: {
        errors: ["Trail not found"],
        status: 404
      }
    end
  end

  def create
    @trail = Trail.new(trail_params)
    @trail.author_id = @user.id
    if @trail.save
      render json: @trail
    end
  end

  def edit
    # needs authorization
    @trail = Trail.find(params[:id])
    if @trail
      render json: @trail, include: {sections: [:resources]}
    else
      render json: {
        errors: ["Unauthorized"],
        status: 401
      }
    end
  end

  def destroy
    Trail.destroy(params[:id])
    render json: {
      message: "Deleted trail #{params[:id]}"
    }
  end

  def featured_trails
    @results = Trail.order(votes_count: :desc).limit(9)
    render json: @results
  end

  private

  def trail_params
    params.require(:trail).permit(:title, :description, :user_id, :category_id, :image_url)
  end

end
