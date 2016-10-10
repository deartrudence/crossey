class User < ActiveRecord::Base
  rolify strict: true
  has_many :individual_reviews
  has_one :profile
  has_many :user_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_employee?
  	self.profile.user_roles.map(&:name).include?('Employee')
  end

  def is_reviewer?
  	self.profile.user_roles.map(&:name).include?('Reviewer')
  end

  def is_principal?
  	self.profile.user_roles.map(&:name).include?('Principal')
  end

  def is_super_admin?
  	self.profile.user_roles.map(&:name).include?('SuperAdmin')
  end
end
