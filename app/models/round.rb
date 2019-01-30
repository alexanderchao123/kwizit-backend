class Round < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :quiz
  has_many :admissions
  has_many :guests, through: :admissions
  has_many :round_questions
  has_many :decisions, through: :round_questions

  before_save :generate_pin

  def generate_pin
    self.pin = SecureRandom.hex(3)
    generate_pin if Round.exists?(pin: self.pin)
  end

end
