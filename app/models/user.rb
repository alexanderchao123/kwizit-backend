class User < ApplicationRecord
  has_many :created_quizzes, class_name: "Quiz", foreign_key: "creator_id"
  has_many :plays
  has_many :rounds, through: :play
  has_many :taken_quizzes, through: :rounds
  has_secure_password
end
