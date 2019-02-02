class Guest < ApplicationRecord
  has_many :admissions
  has_many :decisions

  validates :nickname, presence: true
end
