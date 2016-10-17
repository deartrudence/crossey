require 'rails_helper'

RSpec.describe Section, type: :model do
  
  it "has a valid factory" do
    expect(build(:section)).to be_valid
  end

end
