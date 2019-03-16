class Api::V1::RoundQuestionsController < ApplicationController
  def create
    question = current_round.current_question.as_json(include: ["choices"])
    render json: {question: question}
  end

  def update
    round_question = current_round.round_questions.last.update(active: false)
    render json: {round_question: round_question}
  end

  private
    def current_round
      Round.find_by(pin: params[:round_pin])
    end
end
