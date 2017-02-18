class Api::V1::VotesController < Api::V1::ApplicationController

  #before_action :authenticate_user, only: :create

  def create
    @trail = Trail.find(params[:trail_id])
    @user = User.find(params[:user_id])
    vote_up_trail unless already_voted_for_trail
    render json: {"trail_votes": @trail.votes.count}, status: 200
  end

  private

  def vote_up_trail
    @user.voted_trails << @trail
  end

  def already_voted_for_trail
    @user.voted_trails.include?(@trail)
  end

end
