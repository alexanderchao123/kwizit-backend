class RoundQuestion < ApplicationRecord
  belongs_to :round
  belongs_to :question
  has_many :decisions

  validates :expiration, presence: true

  def is_expired?
    self.expiration() > Time.now()
  end
end
