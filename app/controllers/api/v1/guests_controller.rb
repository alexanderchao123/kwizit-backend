class Api::V1::GuestsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    guest = Guest.new(guest_params)
    if guest.save
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {guest: guest, message: "#{guest.nickname} just joined!"})
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
