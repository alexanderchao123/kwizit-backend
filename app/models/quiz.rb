class Quiz < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  has_many :choices, through: :questions
  has_many :rounds
  has_many :round_questions, through: :rounds
  has_many :decisions, through: :round_questions
  has_many :admissions, through: :rounds
  has_many :guests, through: :admissions
  accepts_nested_attributes_for :questions
end
