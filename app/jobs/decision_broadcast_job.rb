class DecisionBroadcastJob < ApplicationJob
  queue_as :default

  def perform(decision)
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Choice Sent", data: decision})
  end
end
