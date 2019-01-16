class Round < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :quiz
  has_many :plays
  has_many :users, through: :plays
end