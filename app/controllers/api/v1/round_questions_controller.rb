# frozen_string_literal: true

module Api
  module V1
    # This controller handles the RoundQuestion model
    class RoundQuestionsController < ApplicationController
      skip_before_action :authorized, only: [:index, :create, :update]

      def index
        render json: { round_questions: round_questions }
      end

      def create
        if has_active_round_question?
          render json: { round_question: active_round_question.as_json(include: { question: { include: :choices } }) }
        else
          if has_questions?
            round_question = RoundQuestion.create(round: current_round, question: next_question)
            render json: { round_question: round_question.as_json(include: { question: { include: :choices } }) }
          else
            render json: {round_question: current_round.round_questions.new()}
          end
        end
      end

      def update
        round_question = active_round_question.update(active: false)
        render json: { round_question: round_question }
      end

      private

      def current_round
        Round.find_by(pin: params[:round_pin])
      end

      def round_questions
        current_round.round_questions
      end

      def active_round_question
        current_round.round_questions.find { |round_question| round_question.active == true }
      end

      def has_active_round_question?
        !!active_round_question
      end

      def questions
        current_round.questions
      end

      def activated_round_questions
        current_round.round_questions.select { |round_question| round_question.active == false }
      end

      def has_questions?
        questions.size - activated_round_questions.size > 0
      end

      def next_question
        questions[activated_round_questions.size]
      end
    end
  end
end
