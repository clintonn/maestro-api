class Api::V1::SessionsController < Api::V1::ApplicationController
  def create
    binding.pry
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
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
