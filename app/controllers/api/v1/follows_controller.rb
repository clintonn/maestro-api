class Api::V1::FollowsController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create
    @trail = Trail.find(params[:trail_id])
    @user = User.find(params[:user_id])
    follow_trail unless user_already_follows_trail
    render json: @trail, include: [:author, sections: [:resources]]
  end

  def destroy
    @trail = Trail.find(params[:trail_id])
    @user = User.find(params[:user_id])
    unfollow_trail unless user_does_not_follow_trail
    render json: @trail, include: [:author, sections: [:resources]]
  end

  private

  def follow_trail
    @user.followed_trails << @trail
  end

  def user_already_follows_trail
    @user.followed_trails.include?(@trail)
  end

  def unfollow_trail
    @user.followed_trails.delete @trail
  end

  def user_does_not_follow_trail
    !@user.followed_trails.include?(@trail)
  end

end
