class Api::V1::ApplicationController < ActionController::API

  def authenticate_user
    user_id = Auth.decode(params["jwt"])[0]["user_id"] if params["jwt"]
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
