# frozen_string_literal: true

class Choice < ApplicationRecord
  belongs_to :question
  has_many :decisions

  validates :answer, presence: true

  def attributes
    { id: id, question_id: question_id, answer: answer, correct: correct }
  end
end
