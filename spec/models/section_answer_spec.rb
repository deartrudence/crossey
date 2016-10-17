require 'rails_helper'

RSpec.describe SectionAnswer, type: :model do
  
  it "has a valid factory" do
    expect(build(:section_answer)).to be_valid
  end

end
