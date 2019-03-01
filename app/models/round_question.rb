class RoundQuestion < ApplicationRecord
  belongs_to :round
  belongs_to :question
  has_many :decisions

  validates :expiration, presence: true

  def attributes
    {id: id, round_id: round_id, question_id: question_id, expiration: expiration}
  end

  def is_expired?
    self.expiration() > Time.now()
  end
end
