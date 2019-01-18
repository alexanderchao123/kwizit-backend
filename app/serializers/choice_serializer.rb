class ChoiceSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :answer, :correct
  belongs_to :question
end
