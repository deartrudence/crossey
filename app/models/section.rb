class Section < ActiveRecord::Base
  belongs_to :review
  has_many :questions
  has_many :section_answers
end
