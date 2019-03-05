class Question < ApplicationRecord
  belongs_to :quiz
  has_one_attached :image
  has_many :choices
  has_many :round_questions
  accepts_nested_attributes_for :choices, reject_if: lambda {|attributes| attributes[:answer].blank?}

  validates :title, presence: true
  validates :difficulty, presence: true

  def attributes
    {id: id, quiz_id: quiz_id, title: title, difficulty: difficulty, time: time}
  end
end
