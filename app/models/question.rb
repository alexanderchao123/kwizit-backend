class Question < ApplicationRecord
  belongs_to :quiz
  has_one_attached :image
  has_many :choices, dependent: :destroy
  has_many :round_questions
  accepts_nested_attributes_for :choices, reject_if: lambda {|attributes| attributes[:answer].blank?}

  validates :title, presence: true
  validates :difficulty, presence: true
  validate :require_two_choices
  validate :require_correct_choice

  def attributes
    {id: id, quiz_id: quiz_id, title: title, difficulty: difficulty, time: time}
  end

  def has_two_choices?
    self.choices.size >= 2
  end

  def require_two_choices
    errors.add(:base, "You must provide at least two choice") unless has_two_choices?()
  end

  def has_correct_choice?
    self.choices.any? {|choice| choice.correct == true}
  end

  def require_correct_choice
    errors.add(:message, "You must select a correct choice") unless has_correct_choice?()
  end
end
