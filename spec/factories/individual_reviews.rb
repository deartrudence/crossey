FactoryGirl.define do

  factory :individual_review do
    association :user, factory: :user
  end

  factory :individual_review_with_questions do
		after(:build) do |individual_review|
			section1 = create(:section, individual_review: individual_review)
			question1 = create(:question, section: section1)
  		question2 = create(:question, section: section1)
  		question3 = create(:question, section: section1)
		end
	end

  factory :individual_review_with_answers do
		after(:build) do |individual_review|
			create(:review_with_questions)
  		answer1 = create(:answer, question: question1)
  		answer2 = create(:answer, question: question2)
  		answer3 = create(:answer, question: question3)
		end
	end

end
