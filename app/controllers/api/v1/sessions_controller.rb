class Api::V1::SessionsController < Api::V1::ApplicationController
  def create

    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      jwt = Auth.issue({user_id: @user.id})
      render json: {
        jwt: jwt, userId: @user.id
      }
    end
  end

  def destroy
   jwt = nil
   render json: { jwt: jwt, userId: @user.id }
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
