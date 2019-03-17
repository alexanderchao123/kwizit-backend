class RoundQuestion < ApplicationRecord
  belongs_to :round
  belongs_to :question
  has_many :decisions

  def attributes
    {id: id, round_id: round_id, question_id: question_id, active: active}
  end
end
