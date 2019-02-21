class RoundQuestionsController < ApplicationController
  def index
  end

  def create
    round = Round.find_by(pin: round_question_params[:round_pin])
    # question = round.questions
  end

  def show
  end

  private
    def round_question_params
      params.require(:round_question).permit(:round_pin, :question_id)
    end
end
