class Decision < ApplicationRecord
  belongs_to :user
  belongs_to :round_question
  belongs_to :choice

  def attributes
    {id: id, guest_id: guest_id, round_question_id: round_question_id, choice_id: choice_id, correct: correct}
  end
end
