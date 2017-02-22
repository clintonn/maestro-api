class Api::V1::VotesController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create
    @trail = Trail.find(params[:trail_id])
    @user = User.find(params[:user_id])
    user_already_voted_for_trail ? downvote_trail : vote_up_trail
    render json: @trail, include: [:author, sections: [:resources]]
  end

  private

  def vote_up_trail
    @user.voted_trails << @trail if !@user.voted_trails.include?(@trail)
  end

  def downvote_trail
    @user.votes.where(trail_id: @trail.id)[0].destroy
  end

  def user_already_voted_for_trail
    @user.voted_trails.include?(@trail)
  end

end
