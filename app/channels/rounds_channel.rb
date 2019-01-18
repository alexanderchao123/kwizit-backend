class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_#{params[:round_id]}"
    ActionCable.server.broadcast('rounds', {message: "Successfully Connected"})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message)
    ActionCable.server.broadcast("round_#{params[:round_id]}", {message: "Welcome from round: #{params[:round_id]}"})
  end
end
