# frozen_string_literal: true

class Quiz < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_one_attached :cover
  has_many :questions, dependent: :destroy
  has_many :rounds
  accepts_nested_attributes_for :questions, reject_if: lambda { |attributes| attributes[:title].blank? }

  validates :title, presence: true
  validates :description, presence: true
  validate :require_one_question

  def attributes
    { id: id, creator_id: creator_id, title: title, description: description, public: public }
  end

  def has_one_question?
    questions.size >= 1
  end

  def require_one_question
    errors.add(:base, 'You must provide at least two choice') unless has_one_question?()
  end
end
