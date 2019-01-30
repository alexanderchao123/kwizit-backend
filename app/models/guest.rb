class Guest < ApplicationRecord
  has_many :admissions
  has_many :decisions
end
