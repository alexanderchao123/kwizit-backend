# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

      def find_verified_user
        begin
          token = request.params[:token]
          decoded_token = JWT.decode(token, "SECRET", true, algorithm: 'HS256')[0]
          if (current_user = User.find_by(id: decoded_token["user_id"]))
            current_user
          else
            reject_unauthorized_connection
          end
        rescue
          reject_unauthorized_connection
        end
      end
  end
end
