class Quiz < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  has_many :rounds
  accepts_nested_attributes_for :questions
end
