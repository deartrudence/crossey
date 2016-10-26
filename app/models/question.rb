class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answers
  has_many :question_job_levels

  def self.belongs_to_job_level(job_level)
  	user_job_level = job_level.to_i
    self.where(id: QuestionJobLevel.where(job_level: user_job_level).map(&:question_id))
  end

  def self.belongs_to_next_job_level(job_level)
  	user_job_level = job_level.to_i  + 1
  	self.where(id: QuestionJobLevel.where(job_level: user_job_level).map(&:question_id))
  end

  def self.belongs_to_review(review)
    self.where(id: review.questions.map(&:id))
  end
end
