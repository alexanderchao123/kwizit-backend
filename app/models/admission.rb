class Admission < ApplicationRecord
  belongs_to :guest
  belongs_to :round
end
