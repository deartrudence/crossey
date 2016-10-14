class Question < ActiveRecord::Base
  belongs_to :section
  has_many :answers

  scope :question_belongs_to_job_level, -> (user_level) { where('job_type = ?', user_level.to_i) }
  scope :question_belongs_to_next_job_level, -> (user_level) { where('job_type = ?', user_level.to_i + 1) }

  def belongs_to_job_level?(user)
  	user_job_level = user.profile.job_level
  	self.job_type.to_i == user_job_level
  end

  def belongs_to_next_job_level?(user)
  	user_job_level = user.profile.job_level  + 1
  	self.job_type.to_i == user_job_level
  end
end
