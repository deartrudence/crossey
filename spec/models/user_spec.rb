require 'rails_helper'
require 'cancan'
require 'cancan/matchers'
require_relative '../../app/models/ability.rb'

RSpec.describe User, type: :model do
  
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "returns true if user is employee" do 
  	user = create(:user)
  	profile = create(:profile, user: user)
  	create(:user_role, user: user)
  	expect(user.is_employee?).to eq(true)
  end

  it "returns true if user is reviewer" do 
  	user = create(:user)
  	profile = create(:profile, user: user)
  	create(:user_role, user: user, name: 'Reviewer')
  	expect(user.is_reviewer?).to eq(true)
  end

  it "returns true if user is principal" do 
  	user = create(:user)
  	profile = create(:profile, user: user)
  	create(:user_role, user: user, name: "Principal")
  	expect(user.is_principal?).to eq(true)
  end

  it "returns true if user is super_admin" do 
  	user = create(:user)
  	profile = create(:profile, user: user)
  	create(:user_role, user: user, name: "SuperAdmin")
  	expect(user.is_super_admin?).to eq(true)
  end

end
