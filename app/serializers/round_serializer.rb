class RoundSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :quiz_id, :pin, :complete
  belongs_to :quiz
end
