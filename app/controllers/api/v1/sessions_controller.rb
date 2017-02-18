class Api::V1::SessionsController < Api::V1::ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      jwt = Auth.issue({user_id: @user.id})
      render json: {
        jwt: jwt,
        user: {id: @user.id, email: @user.email, trails: @user.trails}
      }
    end
  end

  def destroy
   jwt = 'null'
   render json: { jwt: jwt }
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
