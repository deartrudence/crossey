class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answers
  has_many :question_job_levels

  scope :question_belongs_to_job_level, -> (user_level) { where(job_type: user_level.to_i) }
  scope :question_belongs_to_next_job_level, -> (user_level) { where(job_type: user_level.to_i + 1) }

  def self.belongs_to_job_level(job_level)
  	user_job_level = job_level.to_i
    self.joins(:question_job_levels).where(id: QuestionJobLevel.where(job_level: user_job_level).map(&:question_id))
  end

  def self.belongs_to_next_job_level(job_level)
  	user_job_level = job_level.to_i  + 1
  	self.joins(:question_job_levels).where(id: QuestionJobLevel.where(job_level: user_job_level).map(&:question_id))
  end
end
