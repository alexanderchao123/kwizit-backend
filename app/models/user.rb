class User < ApplicationRecord
  has_many :created_quizzes, class_name: "Quiz", foreign_key: "creator_id"
  has_many :plays
  has_many :rounds, through: :plays
  has_many :taken_quizzes, through: :rounds, class_name: "Quiz", source: :quiz
  has_secure_password
end
