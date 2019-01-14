class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    users = User.all
    render json: users, staus: :accepted
  end

  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: token}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
