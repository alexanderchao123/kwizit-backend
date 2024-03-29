# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorized, only: %i[index create]

      def index
        users = User.all
        render json: { users: users }, staus: :accepted
      end

      def create
        user = User.new(user_params)
        if user.save
          token = encode_token(user_id: user.id)
          render json: { user: user, jwt: token }, status: :created
        else
          render json: { error: user.errors.full_messages }, status: :not_acceptable
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
      end
    end
  end
end
