class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_#{params[:round_pin]}"
    current_admission.update(active: true)
    if is_player?(current_round)
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Player Connected", data: current_user})
    else
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Host Connected", data: current_user})
    end
  end

  def unsubscribed
    current_admission.update(active: false)
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
  end

  private
    def current_round
      Round.find_by(pin: params[:round_pin])
    end

    def current_admission
      current_round.admissions.find_or_create_by(user: current_user)
    end
end
