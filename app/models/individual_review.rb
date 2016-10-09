class IndividualReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  has_many :questions, through: :review
  has_many :signatures, dependent: :destroy
  has_many :answers

  accepts_nested_attributes_for :answers, allow_destroy: :true

  accepts_nested_attributes_for :signatures, allow_destroy: :true

  resourcify
end
