class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_#{params[:round_pin]}"
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {message: "Successfully Connected"})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {isQuestionDisplayed: true})
  end
end
