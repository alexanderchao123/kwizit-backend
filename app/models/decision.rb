# frozen_string_literal: true

class Decision < ApplicationRecord
  belongs_to :user
  belongs_to :round_question
  belongs_to :choice

  # after_create_commit { DecisionBroadcastJob.perform_later self }

  def attributes
    { id: id, user_id: user_id, round_question_id: round_question_id, choice_id: choice_id, correct: correct }
  end
end
