# frozen_string_literal: true

module Api
  module V1
    class RoundsController < ApplicationController
      skip_before_action :authorized, only: %i[index show]

      def index
        quiz = Quiz.find_by(id: params[:quiz_id])
        rounds = quiz.rounds
        render json: { rounds: rounds }, status: :accepted
      end

      def create
        round = current_user.rounds.new(quiz_id: params[:quiz_id])
        if round.save
          render json: { round: round }, status: :created
        else
          render json: { error: round.errors.full_messages }, status: :not_acceptable
        end
      end

      def show
        if current_round && !current_round.complete
          round = current_round.as_json(include: { quiz: { include: :questions } })
          render json: { round: round }, status: :accepted
        else
          render json: { error: "We didn't recognize that game PIN. Please check and try again." }, status: :not_acceptable
        end
      end

      def count
        questions = current_round.quiz.questions
        round_questions = current_round.round_questions
        count = questions.size - round_questions.size
        render json: { count: count }
      end

      private

        def round_params
          params.require(:round).permit(:quiz_id)
        end

        def current_round
          Round.find_by(pin: params[:pin])
        end
    end
  end
end
