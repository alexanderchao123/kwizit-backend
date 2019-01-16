class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rounds"
    ActionCable.server.broadcast('rounds', {message: "Successfully"})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message)
    ActionCable.server.broadcast('rounds', {message: "Welcome from speak"})
  end
end
