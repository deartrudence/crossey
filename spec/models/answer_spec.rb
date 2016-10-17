require 'rails_helper'

RSpec.describe Answer, type: :model do
  
  it "has a valid factory" do
    expect(build(:answer)).to be_valid
  end
  
end
