class Round < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :quiz
  has_many :admissions
  has_many :users, through: :admissions
  has_many :round_questions

  before_save :generate_pin

  def attributes
    {id: id, host_id: host_id, quiz_id: quiz_id, pin: pin, complete: complete}
  end

  def generate_pin
    self.pin = SecureRandom.hex(3)
    generate_pin if Round.exists?(pin: self.pin)
  end
end
