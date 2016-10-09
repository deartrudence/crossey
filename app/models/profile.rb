class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :user_roles, through: :user

  USER_ROLES = ["Employee", "Reviewer"]

  attr_accessor :user_role

  accepts_nested_attributes_for :user_roles, allow_destroy: :true

end
