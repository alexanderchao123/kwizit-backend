class Question < ApplicationRecord
  belongs_to :quiz
  has_one_attached :image
  has_many :choices, dependent: :destroy
  has_many :round_questions
  accepts_nested_attributes_for :choices, reject_if: lambda {|attributes| attributes[:answer].blank?}

  validates :title, presence: true
  validates :difficulty, presence: true
  validate :require_two_choices
  validate :correct_choice

  def attributes
    {id: id, quiz_id: quiz_id, title: title, difficulty: difficulty, time: time}
  end

  def require_two_choices
    errors.add(:base, "You must provide at least two choice") if self.choices.size < 2
  end

  def correct_choice
    errors.add(:base, "You must select a correct choice") if !is_correct?()
  end

  def is_correct?
    self.choices.any? {|choice| choice.correct == true}
  end
end
