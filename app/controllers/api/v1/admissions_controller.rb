# frozen_string_literal: true

module Api
  module V1
    class AdmissionsController < ApplicationController
      skip_before_action :authorized, only: %i[index]

      def index
        admissions = active_admissions.map { |admission| admission.as_json(include: :user) }
        render json: { admissions: admissions }
      end

      private

      def current_round
        Round.find_by(pin: params[:round_pin])
      end

      def active_admissions
        current_round.admissions.where(active: true).order(updated_at: :asc)
      end
    end
  end
end
