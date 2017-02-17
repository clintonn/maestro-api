class Api::V1::UsersController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :update

  def update

  end

  def auth
    jwt = params["jwt"]
    begin
      @user_id = Auth.decode(jwt)[0]["user_id"]
    rescue JWT::DecodeError
      # render json: {
      #   message: "User does not own this trail."
      # }, status: 403
       render json: {
        "user_id": 'null'
        }, status: 200
    end
    unless response_body
     render json: {
      "user_id": @user_id
      }, status: 200
    end
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
