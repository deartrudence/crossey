require 'rails_helper'

RSpec.describe UserRole, type: :model do
  
  it "has a valid factory" do
    expect(build(:user_role)).to be_valid
  end

end
