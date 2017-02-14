class Api::V1::UsersController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :update

  def update

  end

  def create
    @user = User.new(user_params)
    if @user.save
      jwt = Auth.issue({user_id: @user.id})
      render json: {
        jwt: jwt, userId: @user.id
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
