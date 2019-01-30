class Api::V1::DecisionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    require 'pry' ; binding.pry
  end

  private
    def decision_params
      params.require(:decision).permit(:guest_id, :round_id, :question_id)
    end
end
