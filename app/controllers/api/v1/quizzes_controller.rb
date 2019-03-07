class Api::V1::QuizzesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    quizzes = Quiz.all
    render json: {quizzes: quizzes}, status: :accepted
  end

  def create
    quiz = current_user.quizzes.new(quiz_params)
    require 'pry' ; binding.pry
    if quiz.save
      render json: {quiz: quiz}, status: :created
    else
      render json: {error: quiz.errors.full_messages}, status: :not_acceptable
    end
  end

  def show
    quiz = current_quiz.as_json(include: {questions: {include: :choices}})
    if quiz
      render json: {quiz: quiz}, status: :accepted
    else
      render json: {error: "Couldn't find it"}, status: :not_acceptable
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title, :description, :cover, questions_attributes: [:title, :difficulty, choices_attributes: [:answer, :correct]])
    end

    def current_quiz
      Quiz.find_by(id: params[:id])
    end
end
