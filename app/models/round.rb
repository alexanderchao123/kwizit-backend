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
    # retrieve the questions in the quiz
    # check if all the questions have been called [questions - (round_questions that are expired)]
    # if all questions have been called, return nil
    # if there is currently an active round_question (not expired), return the associated question
    # if there isn't an active round_question && there are still questions in the array, create a round question associated to the question then return the question
    questions = self.quiz.questions
  end
end
