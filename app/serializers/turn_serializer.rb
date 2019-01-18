class TurnSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :round_id, :choice_id
  belongs_to :user
  belongs_to :round
  belongs_to :choice
end
