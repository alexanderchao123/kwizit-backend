class Api::V1::QuizzesController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
    quizzes = Quiz.all
    render json: {quizzes: quizzes}, status: :accepted
  end

  def create
    require 'pry' ; binding.pry
    quiz = current_user.created_quizzes.new(quiz_params)
    if quiz.save
      render json: {quiz: quiz}, status: :created
    else
      render json: {error: quiz.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title, :description, questions_attributes: [:title, :difficulty, answers_attributes: [:title, :correct]])
    end
end
