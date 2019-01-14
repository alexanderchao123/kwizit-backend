class Quiz < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  has_many :answers, through: :questions
  has_many :rounds
  has_many :plays, through: :rounds
  has_many :users, through: :plays
  accepts_nested_attributes_for :questions
end
