class Api::V1::GuestsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    require 'pry' ; binding.pry
    guest = Guest.new(guest_params)
    if guest.save
      render json: {guest: guest}, status: :created
    else
      render json: {error: guest.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    def guest_params
      params.require(:guest).permit(:nickname)
    end
end
