class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :user_roles, through: :user

  USER_ROLES = ["Employee", "Reviewer"]

  JOB_LEVELS = {
  	EIT1: 1,
  	EIT2: 2,
  	EIT3: 3,
  	EIT4: 4,
  	D1: 1,
  	D2: 2,
  	D3: 3,
  	D4: 4
  }

  before_save :set_job_level

  attr_accessor :user_role

  accepts_nested_attributes_for :user_roles, allow_destroy: :true

  scope :less_than_level, -> (level) { where("job_level < ?", level ) }
  scope :by_job_type, -> (type) { where(job_type: type) }

  def name
  	"#{self.first_name} #{self.last_name}"
  end

  def set_job_level
  	job_level = Profile::JOB_LEVELS[self.job_title.to_sym]
  	self.job_level = job_level
  	# self.save
  end
end
