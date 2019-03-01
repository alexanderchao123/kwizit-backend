class Api::V1::RoundsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    quiz = Quiz.find_by(id: params[:quiz_id])
    rounds = quiz.rounds
    render json: {rounds: rounds}, status: :accepted
  end

  def create
    round = current_user.rounds.new(quiz_id: params[:quiz_id])
    if round.save
      render json: {round: round}, status: :created
    else
      render json: {error: round.errors.full_messages}, status: :not_acceptable
    end
  end

  def show
    round = Round.find_by(pin: params[:pin])
    if round && !round.complete
      round = round.as_json(:include => :quiz)
      render json: {round: round}, status: :accepted
    else
      render json: {error: "We didn't recognize that game PIN. Please check and try again."}, status: :not_acceptable
    end
  end

  def current_question
    # find the round
    # check if the round_questions length is equal to the quiz questions length
    # check the round for unexpired round_question
    # if the last round_question is expired render new question
    # else render the unexpired round_question

    round = Round.find_by(pin: params[:pin])
    question = round.quiz.questions[round.round_questions.length]
    if round.round_questions.length >= round.quiz.questions.length
      question = {title: "", difficulty: "", time: 0}
      render json: {question: question, last_question: true}
    else
      render json: {question: question, last_question: false}
      round.round_questions.create(question: question, expiration: Time.now())
    end


    # round = Round.find_by(pin: params[:pin])
    # question = round.quiz.questions[round.round_questions.length]
    # round.round_questions.create(question: question, expiration: Time.now())
    # render json: {question: question}
  end

  private
    def round_params
      params.require(:round).permit(:quiz_id)
    end
end
