class User < ApplicationRecord
  has_many :created_quizzes, class_name: "Quiz", foreign_key: "creator_id"
  has_many :turns
  has_many :played_rounds, through: :turns, class_name: "Round", source: :round
  has_many :taken_quizzes, through: :played_rounds, class_name: "Quiz", source: :quiz
  has_many :hosted_rounds, class_name: "Round", foreign_key: "host_id"
  has_secure_password
end
