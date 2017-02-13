class Api::V1::UsersController < Api::V1::ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      Auth.encrypt({user_id: @user.id})
      render json: {
        jwt: jwt, name: @user.name
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
