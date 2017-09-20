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
    user_array = self.authored_reviews.not_archived.map(&:employee_id)
    return User.includes(:profile).where(id: user_array).not_archived
    # ser.includes(:profile).all.joins(:profile)
  end

  def reviewer_completed_reviews
    review_array = self.authored_reviews.not_archived.map(&:id)
    return IndividualReview.where(id: review_array).completed
  end

  def reviewer_completed_reviews_percentage
    self.reviewer_completed_reviews.not_archived.count.to_f / self.authored_reviews.not_archived.count.to_f
  end

  def underlings
    underling_array = Profile.by_job_type(self.profile.job_type).less_than_level(self.profile.job_level).map(&:user_id)
    return User.includes(:profile).where(id: underling_array).not_archived
  end

  def has_incomplete_reviews?
    incomplete_number = IndividualReview.not_archived.incompleted.where(employee_id: self.id).count
    if incomplete_number > 0
      return true
    else
      return false
    end
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
