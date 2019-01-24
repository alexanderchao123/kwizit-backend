class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices
  has_many :turns
  accepts_nested_attributes_for :choices
end
