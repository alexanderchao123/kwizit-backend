class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      token = JWT.encode({user_id: user.id}, "SECRET")
      render json: {user: user, jwt: token}
    else
      render json: {error: user.errors.full_messages}, status: 400
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
