class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices
  accepts_nested_attributes_for :choices
end
