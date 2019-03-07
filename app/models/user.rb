class User < ApplicationRecord
  has_one_attached :avatar
  has_many :quizzes, class_name: "Quiz", foreign_key: "creator_id"
  has_many :rounds, class_name: "Round", foreign_key: "host_id"
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}

  def attributes
    {id: id, first_name: first_name, last_name: last_name, email: email}
  end
end
