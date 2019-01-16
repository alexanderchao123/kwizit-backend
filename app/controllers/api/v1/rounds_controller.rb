class Api::V1::RoundsController < ApplicationController
  def create
    # require 'pry' ; binding.pry
    round = current_user.hosted_rounds.new(quiz_id: params[:quiz_id])
    if round.save
      render json: round, status: :accepted
    else
      render json: {error: round.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    def round_params
      params.require(:round).permit(:quiz_id)
    end
end
