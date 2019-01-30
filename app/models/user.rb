class User < ApplicationRecord
  has_many :quizzes, class_name: "Quiz", foreign_key: "creator_id"
  has_many :rounds, class_name: "Round", foreign_key: "host_id"
  has_secure_password
end
