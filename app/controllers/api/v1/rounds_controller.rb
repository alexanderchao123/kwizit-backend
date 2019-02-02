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
      round = round.as_json(include: {quiz: {include: :questions}})
      render json: {round: round}, status: :accepted
    else
      render json: {error: "We didn't recognize that game PIN. Please check and try again."}, status: :not_acceptable
    end
  end

  private
    def round_params
      params.require(:round).permit(:quiz_id)
    end
end
