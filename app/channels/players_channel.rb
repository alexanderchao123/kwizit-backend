class PlayersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "players_#{params[:token]}"
    ActionCable.server.broadcast("players_#{params[:token]}", {type: "Private Connection", data: current_user})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
