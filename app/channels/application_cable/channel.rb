module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def is_host?(round)
      current_user == round.host
    end
  end
end
