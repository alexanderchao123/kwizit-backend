class Quiz < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_one_attached :cover
  has_many :questions, dependent: :destroy
  has_many :rounds
  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes[:title].blank?}

  validates :title, presence: true
  validates :description, presence: true

  def attributes
    {id: id, creator_id: creator_id, title: title, description: description, public: public}
  end
end
