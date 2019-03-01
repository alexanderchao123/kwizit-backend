class Guest < ApplicationRecord
  has_many :admissions
  has_many :decisions

  validates :nickname, presence: true

  def attributes
    {id: id, nickname: nickname}
  end
end
