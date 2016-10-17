require 'rails_helper'

RSpec.describe Signature, type: :model do
  
  it "has a valid factory" do
    expect(build(:signature)).to be_valid
  end

end
