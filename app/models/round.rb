class Round < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :quiz
  has_many :turns
  has_many :users, through: :turns

  before_save :generate_pin

  def generate_pin
    self.pin = SecureRandom.hex(3)
    generate_pin if Round.exists?(pin: self.pin)
  end

end
