class Decision < ApplicationRecord
  belongs_to :guest
  belongs_to :round
  belongs_to :question
end
