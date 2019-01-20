class ChoiceSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :answer, :correct
  belongs_to :question
  belongs_to :quiz, through: :question
end
