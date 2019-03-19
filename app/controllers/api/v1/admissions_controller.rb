class Api::V1::AdmissionsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    admissions = active_admissions.map {|admission| admission.as_json(include: :user)}
    render json: {admissions: admissions}
  end

  private
    def current_round
      Round.find_by(pin: params[:round_pin])
    end

    def active_admissions
      current_round.admissions.where(active: true).order(updated_at: :desc)
    end
end
