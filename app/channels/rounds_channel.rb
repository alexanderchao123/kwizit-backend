class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_#{params[:round_pin]}"
    round = Round.find_by(pin: params[:round_pin])
    admission = round.admissions.create(user: current_user)
    if is_player?(round)
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Player Connected", data: current_user})
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
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
    require 'pry' ; binding.pry
  end
end
