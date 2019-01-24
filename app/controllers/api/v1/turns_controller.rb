class Api::V1::TurnsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    require 'pry' ; binding.pry
  end

  private
    def turn_params
      params.require(:turn).permit(:guest_id, :round_id, :question_id)
    end
end
