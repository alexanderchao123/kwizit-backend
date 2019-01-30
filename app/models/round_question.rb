class RoundQuestion < ApplicationRecord
  belongs_to :round
  belongs_to :question
  has_many :decisions
end
