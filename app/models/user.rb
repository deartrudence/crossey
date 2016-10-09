class User < ActiveRecord::Base
  rolify strict: true
  has_many :individual_reviews
  has_one :profile
  has_many :user_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
