class Api::V1::UsersController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :update

  def create
    @user = User.new(user_params)
    if @user.save
      jwt = Auth.issue({user_id: @user.id})
      render json: {
        jwt: jwt, user: @user
      }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update

  end

  def auth
    jwt = params["jwt"]
    begin
      @user_id = Auth.decode(jwt)[0]["user_id"]
      @user = User.find(@user_id)
    rescue JWT::DecodeError
       render json: {
         "user": "null"
        }, status: 202
    end
    unless response_body
     render json: @user
    end
  end



  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
