class Api::V1::ApplicationController < ActionController::API

  def authenticate_user
    user_id = Auth.decode(request.headers['HTTP_AUTHORIZATION'])[0]["user_id"] if request.headers['HTTP_AUTHORIZATION']
    if user_id
      @user = User.find(user_id)
    else
      render json: {
        errors: ["Unauthorized"],
        status: 401
      }
    end
  end

end
