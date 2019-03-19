class RoundsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "round_#{params[:round_pin]}"
    if is_player?(current_round)
      current_admission.update(active: true)
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Player Connected", data: current_user})
    else
      ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Host Connected", data: current_user})
    end
  end

  def unsubscribed
    if is_player?(current_round)
      current_admission.update(active: false)
    end
  end

  def render_choice_block
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Choice Block"})
  end

  def render_choice_result
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Choice Result"})
  end

  def render_ranking
    ActionCable.server.broadcast("round_#{params[:round_pin]}", {type: "Render Ranking"})
  end

  private
    def current_round
      Round.find_by(pin: params[:round_pin])
    end

    def current_admission
      current_round.admissions.find_or_create_by(user: current_user)
    end
end
