require 'rails_helper'

RSpec.describe Review, type: :model do
  
  it "has a valid factory" do
    expect(build(:review)).to be_valid
  end

end
