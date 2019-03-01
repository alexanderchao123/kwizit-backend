class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices
  has_many :round_questions
  accepts_nested_attributes_for :choices

  validates :title, presence: true
  validates :difficulty, presence: true

  def attributes
    {id: id, quiz_id: quiz_id, title: title, difficulty: difficulty, time: time}
  end
end
