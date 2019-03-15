class Api::V1::AdmissionsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    admissions = current_round.admissions.map do |admission|
      admission.as_json(include: :user)
    end
    render json: {admissions: admissions}
  end

  private
    def current_round
      Round.find_by(pin: params[:round_pin])
    end
end
