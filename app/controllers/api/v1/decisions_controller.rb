class Api::V1::DecisionsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    if active_round_question
      selection = params[:choice].to_i
      choice = active_round_question.question.choices[selection]
      decision = current_user.decisions.create(round_question: active_round_question, choice: choice, correct: choice.correct)
      if all_players_answered?
        ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Choice Result"})
        ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Question Result"})
        active_round_question.update(active: false)
        render json: {decision: decision}
      else
        token = auth_header.split(' ')[1]
        ActionCable.server.broadcast("players_#{token}", {type: "Render Choice Sent"})
        render json: {decision: decision}
      end
    end
  end

  def show
    require 'pry' ; binding.pry
  end

  private
    def decision_params
      params.require(:decision).permit(:choice)
    end

    def current_round
      Round.find_by(pin: params[:round_pin])
    end

    def active_admissions
      current_round.admissions.where(active: true)
    end

    def active_round_question
      current_round.round_questions.where(active: true).first
    end

    def all_players_answered?
      active_admissions.size == active_round_question.decisions.size
    end
end
