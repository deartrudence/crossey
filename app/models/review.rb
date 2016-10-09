class Review < ActiveRecord::Base
	has_many :sections
	has_many :questions, through: :sections
	has_many :individual_reviews
end
