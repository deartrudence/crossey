require 'rails_helper'

RSpec.describe QuestionJobLevel, type: :model do
  
  it "has a valid factory" do
    expect(build(:question_job_level)).to be_valid
  end

end
