class Admission < ApplicationRecord
  belongs_to :guest
  belongs_to :round

  def attributes
    {id: id, guest_id: guest_id, round_id: round_id}
  end
end
