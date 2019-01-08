class Round < ApplicationRecord
  belongs_to :quiz
  has_many :plays
  has_many :users, through: :plays
end
