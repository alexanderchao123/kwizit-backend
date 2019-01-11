class Api::V1::AuthController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      token = JWT.encode({user_id: user.id}, "SECRET")
      render json: {user: user, jwt: token}
    else
      render json: {error: user.errors.full_messages}
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
