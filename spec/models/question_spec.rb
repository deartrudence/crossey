require 'rails_helper'

RSpec.describe Question, type: :model do
  
  it "has a valid factory" do
    expect(build(:question)).to be_valid
  end

end
