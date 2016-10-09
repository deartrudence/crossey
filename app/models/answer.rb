class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :individual_review

  ANSWERS = [
  	'Exceeds Expectations', 
  	'Meets Expectations',
  	'Needs Improvement',
  	'N/A'
  ]
end
