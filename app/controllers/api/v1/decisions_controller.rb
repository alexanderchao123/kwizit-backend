class Api::V1::DecisionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    require 'pry' ; binding.pry
    # create a decision
    # if it saves, broadcast action and render object
    # else render error message
  end

  private
    def decision_params
      params.require(:decision).permit(:round_pin, :question_id)
    end
end
