class Api::V1::QuizzesController < ApplicationController
  def index
    quizzes = Quiz.all
    render json: quizzes, status: :accepted
  end

  def create
    quiz = current_user.created_quizzes.new(quiz_params)
    if quiz.save
      render json: {quiz: quiz}, status: :created
    else
      render json: {error: quiz.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title, :description, questions_attributes: [])
    end
end
