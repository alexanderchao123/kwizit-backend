class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_#{params[:round_pin]}"
    admission = current_round.admissions.create(user: current_user)
    if is_player?(current_round)
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Player Connected", data: current_user})
    end
  end

  def unsubscribed
    # require 'pry' ; binding.pry
    admission = current_round.admissions.find_by(user: current_user)
    admission.update(active: false)
  end

  def render_choice_block
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Choice Block"})
  end

  def render_choice_result
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Choice Result"})
  end

  def submit_choice(data)
    # find the round
    # get current question
    # check if the user already answered the question
    # if the user already answered the question
    # if the user hasn't answered the question, while the other players havent, send "Render Choice Sent"
    # else if the user is the last player to answer the question, send "Render Choice Result"
    round = Round.find_by(pin: params[:round_pin])
  end

  private
    def current_round
      round = Round.find_by(pin: params[:round_pin])
    end
end
