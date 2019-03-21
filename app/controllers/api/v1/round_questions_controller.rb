class Api::V1::RoundQuestionsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :update]

  def index
    round_questions = current_round.round_questions
    render json: {round_questions: round_questions}
  end

  def create
    active_round_question = current_round.round_questions.find { |round_question| round_question.active == true }
    if active_round_question
      render json: {round_question: active_round_question.as_json(include: {question: {include: :choices}})}
    else
      questions = current_round.quiz.questions
      activated_round_questions = current_round.round_questions.select { |round_question| round_question.active == false }
      if (questions.size - activated_round_questions.size) > 0
        question = questions[activated_round_questions.size]
        round_question = current_round.round_questions.create(question: question)
        render json: {round_question: round_question.as_json(include: {question: {include: :choices}})}
      else
        # update current_round complete attribute to true
        # current_round.update(complete: true)
        render json: {round_question: current_round.round_questions.new()}
      end
    end
  end

  def update
    round_question = current_round.round_questions.where(active: true)
    round_question = round_question.update(active: false)
    render json: {round_question: round_question}
  end

  private
    def current_round
      Round.find_by(pin: params[:round_pin])
    end
end
