class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_#{params[:round_pin]}"
    round = Round.find_by(pin: params[:round_pin])
    if is_player?(round)
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Player Connected", data: current_user})
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def start_round(data)
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Start Round"})
  end
end
