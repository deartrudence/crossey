class User < ActiveRecord::Base
  # rolify strict: true
  has_many :individual_reviews
  has_one :profile
  has_many :user_roles
  has_many :authored_reviews, class_name: "IndividualReview", :foreign_key => 'reviewer_id'
  has_many :as_employee_reviews, class_name: "IndividualReview", :foreign_key => 'employee_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable
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
