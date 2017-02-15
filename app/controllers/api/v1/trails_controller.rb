class Api::V1::TrailsController < Api::V1::ApplicationController

  # before_action :authenticate_user, only: [:create, :edit]

  def create
    @trail = Trail.new(trail_params)
    @trail.author_id = @user.id
    if @trail.save
      render json: @trail
    end
  end

  def edit
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
