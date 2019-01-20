class QuizSerializer < ActiveModel::Serializer
  attributes :id, :creator_id, :title, :description
  has_many :questions
  has_many :choices, through: :questions
end
