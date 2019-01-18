class Api::V1::QuestionsController < ApplicationController
  def show
    question = Question.find_by(id: params[:id])
    render json: question
  end
end
