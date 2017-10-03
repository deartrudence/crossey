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
  	expect(individual_review.text_answers).to eq([answer2, answer3])
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

  it 'returns correct number of not N/A check answers' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review = create(:individual_review)
		answer1 = create(:answer, question: question1, individual_review: individual_review)
		answer2 = create(:answer, question: question2, individual_review: individual_review)
		answer3 = create(:answer, question: question3, individual_review: individual_review)
  	expect(individual_review.not_na_check_box_answers).to eq(3)
	end

  it 'returns correct total percentage result' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review = create(:individual_review)
		answer1 = create(:answer, question: question1, individual_review: individual_review)
		answer2 = create(:answer, question: question2, individual_review: individual_review)
		answer3 = create(:answer, question: question3, individual_review: individual_review)
  	expect(individual_review.total_percentage_result).to eq(1)
	end
	
	it 'returns correctly identifies has passed' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review = create(:individual_review)
		answer1 = create(:answer, question: question1, individual_review: individual_review)
		answer2 = create(:answer, question: question2, individual_review: individual_review)
		answer3 = create(:answer, question: question3, individual_review: individual_review)
  	expect(individual_review.has_passed?).to eq(true)
	end

	it 'returns correctly identifies has passed' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review = create(:individual_review, employee_completed: true, reviewer_completed: true)
		answer1 = create(:answer, question: question1, individual_review: individual_review)
		answer2 = create(:answer, question: question2, individual_review: individual_review)
		answer3 = create(:answer, question: question3, individual_review: individual_review)
  	expect(individual_review.totally_completed?).to eq(true)
	end
	
	it 'returns correctly returns all in current fiscal year' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review = create(:individual_review, date: Date.today)
  	expect(IndividualReview.in_current_fy).to include(individual_review)
	end
	
	
	it 'returns correctly returns all completed' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review1 = create(:individual_review, employee_completed: true, reviewer_completed: true)
		individual_review2 = create(:individual_review, employee_completed: true, reviewer_completed: false)
  	expect(IndividualReview.completed).to include(individual_review1)
	end
	
	it 'returns correctly returns all incompleted' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review1 = create(:individual_review, employee_completed: true, reviewer_completed: true)
		individual_review2 = create(:individual_review, employee_completed: false, reviewer_completed: true)
  	expect(IndividualReview.incompleted).to include(individual_review2)
	end

	it 'returns correctly returns all incompleted' do
		review = create(:review)
		section1 = create(:section, review: review)
		question1 = create(:question, section: section1)
		question2 = create(:question, section: section1)
		question3 = create(:question, section: section1)
		individual_review1 = create(:individual_review, archived: true)
		individual_review2 = create(:individual_review, archived: false)
  	expect(IndividualReview.not_archived).to include(individual_review2)
	end

	
	
end
