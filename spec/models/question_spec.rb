require 'rails_helper'

RSpec.describe Question, type: :model do
  
  it "has a valid factory" do
    expect(build(:question)).to be_valid
  end

  it "returns correct questions by job level" do
  	question1 = create(:question)
  	qjl1 = create(:question_job_level, question: question1)
  	question2 = create(:question)
  	qjl2 = create(:question_job_level, question: question2, job_level: 2)
  	qjl3 = create(:question_job_level, question: question2, job_level: 3)
  	question3 = create(:question)
  	qjl4 = create(:question_job_level, question: question3, job_level: 3)
  	qjl5 = create(:question_job_level, question: question3, job_level: 4)
  	expect(Question.belongs_to_job_level(3)).to eq([question2, question3])
  end

  it "returns correct questions by next job level" do
  	question1 = create(:question)
  	qjl1 = create(:question_job_level, question: question1)
  	question2 = create(:question)
  	qjl2 = create(:question_job_level, question: question2, job_level: 2)
  	qjl3 = create(:question_job_level, question: question2, job_level: 3)
  	question3 = create(:question)
  	qjl4 = create(:question_job_level, question: question3, job_level: 3)
  	qjl5 = create(:question_job_level, question: question3, job_level: 4)
  	expect(Question.belongs_to_next_job_level(2)).to eq([question2, question3])
  end

end
