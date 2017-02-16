class Api::V1::TrailsController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def show
    @trail = Trail.find(params[:id])
    if @trail
      render json: @trail, include: {sections: [:resources]}
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
      render json: @trail
    else
      render json: {
        errors: ["Unauthorized"],
        status: 401
      }
    end
  end

  private

  def trail_params
    params.require(:trail).permit(:title, :description, :user_id, :category_id)
  end

end
