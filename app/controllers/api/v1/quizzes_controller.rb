class Api::V1::QuizzesController < ApplicationController
  def index
    quizzes = Quiz.all
    render json: quizzes, status: :accepted
  end

  def create
    quiz = Quiz.new(quiz_params)
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title, :description, questions_attributes: [])
    end
end
