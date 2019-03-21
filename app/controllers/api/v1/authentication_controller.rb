# frozen_string_literal: true

module Api
  module V1
    # This controller handles authentication for the User model
    class AuthenticationController < ApplicationController
      skip_before_action :authorized, only: [:create]

      def create
        user = User.find_by(email: user_login_params[:email])
        if user && user.authenticate(user_login_params[:password])
          token = encode_token(user_id: user.id)
          render json: { user: user, jwt: token }, status: :accepted
        else
          render json: { error: user.errors.full_messages }, status: :unauthorized
        end
      end

      def show
        if current_user
          render json: { user: current_user }, status: :accepted
        else
          render json: { error: 'Some Error' }, status: :unprocessable_entity
        end
      end

      private

      def user_login_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
