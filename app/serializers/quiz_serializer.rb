class QuizSerializer < ActiveModel::Serializer
  attributes :id, :creator_id, :title, :description
  has_many :questions
end
