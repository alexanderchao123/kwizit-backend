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

  def current_question
    active_round_question = self.round_questions.find { |round_question| round_question.active == true }
    if active_round_question
      return active_round_question.question
    else
      questions = self.quiz.questions
      activated_round_questions = self.round_questions.select { |round_question| round_question.active == false }
      if (questions.size - activated_round_questions.size) > 0
        question = questions[activated_round_questions.size]
        self.round_questions.create(question: question)
        return question
      else
        return nil
      end
    end
  end
end
