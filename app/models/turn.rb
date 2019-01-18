class Turn < ApplicationRecord
  belongs_to :user
  belongs_to :round
  belongs_to :choice
end
