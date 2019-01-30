class Decision < ApplicationRecord
  belongs_to :guest
  belongs_to :round_question
end
