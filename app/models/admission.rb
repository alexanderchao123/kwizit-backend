class Admission < ApplicationRecord
  belongs_to :user
  belongs_to :round

  def attributes
    {id: id, user_id: user_id, round_id: round_id, active: active}
  end
end
