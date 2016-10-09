class Section < ActiveRecord::Base
  belongs_to :review
  has_many :questions
end
