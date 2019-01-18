class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :quiz_id, :title, :difficulty, :time
  belongs_to :quiz
end
