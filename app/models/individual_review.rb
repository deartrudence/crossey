class IndividualReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  has_many :sections, through: :review
  has_many :questions, through: :review
  has_many :signatures, dependent: :destroy
  has_many :answers
  has_many :section_answers
  belongs_to :employee, :class_name => "User", :foreign_key => "employee_id"
  belongs_to :reviewer, :class_name => "User", :foreign_key => "reviewer_id"

  accepts_nested_attributes_for :answers, allow_destroy: :true

  accepts_nested_attributes_for :signatures, allow_destroy: :true

  resourcify
end
