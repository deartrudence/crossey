class User < ActiveRecord::Base
  # rolify strict: true
  has_many :individual_reviews
  has_one :profile
  has_many :user_roles
  has_many :authored_reviews, class_name: "IndividualReview", :foreign_key => 'reviewer_id'
  has_many :as_employee_reviews, class_name: "IndividualReview", :foreign_key => 'employee_id'

  scope :not_archived, -> { joins(:profile).where(profiles: {archived: false}) }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  def reviewed_users
    user_array = self.authored_reviews.map(&:employee_id)
    return User.includes(:profile).where(id: user_array)
  end

  def reviewer_completed_reviews
    review_array = self.authored_reviews.map(&:id)
    return IndividualReview.where(id: review_array).completed
  end

  def underlings
    underling_array = Profile.by_job_type(self.profile.job_type).less_than_level(self.profile.job_level).map(&:user_id)
    return User.includes(:profile).where(id: underling_array)
  end

# :registerable,
  def is_employee?
    if self.profile.present?
  	 self.profile.user_roles.map(&:name).include?('Employee')
    else
      return false
    end
  end

  def is_reviewer?
    if self.profile.present?
  	 self.profile.user_roles.map(&:name).include?('Reviewer')
    else
      return false
    end
  end

  def is_principal?
    if self.profile.present?
  	 self.profile.user_roles.map(&:name).include?('Principal')
    else
      return false
    end
  end

  def is_super_admin?
    if self.profile.present?
  	 self.profile.user_roles.map(&:name).include?('SuperAdmin')
    else
      return false
    end
  end
end
