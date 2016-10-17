require 'rails_helper'

RSpec.describe IndividualReview, type: :model do
  
  it "has a valid factory" do
    expect(build(:individual_review)).to be_valid
  end

  it "returns text answers for Individual Review" do
  	review = create(:review)
  	section1 = create(:section, review: review)
  	question1 = create(:question, section: section1)
  	question2 = create(:question, question_type: 'text', section: section1)
  	question3 = create(:question, question_type: 'text', section: section1)
  	individual_review = create(:individual_review, review: review)
  	answer1 = create(:answer, question: question1, individual_review: individual_review)
  	answer2 = create(:answer, question: question2, individual_review: individual_review)
  	answer3 = create(:answer, question: question3, individual_review: individual_review)
  	expect(individual_review.text_results).to eq([answer2, answer3])
  end

  it "returns correct tally for check_box answers for Individual Review" do
  	review = create(:review)
  	section1 = create(:section, review: review)
  	question1 = create(:question, section: section1)
  	question2 = create(:question, section: section1)
  	question3 = create(:question, section: section1)
  	individual_review = create(:individual_review)
  	answer1 = create(:answer, question: question1, individual_review: individual_review)
  	answer2 = create(:answer, question: question2, individual_review: individual_review)
  	answer3 = create(:answer, question: question3, individual_review: individual_review)
  	expect(individual_review.check_results).to eq({"Exceeds Expectations"=>0, "Meets Expectations"=>3, "Needs Improvement"=>0, "N/A"=>0})
  end

  it "returns correctly if a user is the reviewer" do 
  	reviewer = create(:user)
  	individual_review = create(:individual_review, reviewer: reviewer)
  	expect(individual_review.is_current_reviewer(reviewer)).to eq(true)
  end

end
