FactoryGirl.define do

  factory :individual_review do
    association :user, factory: :user
    association :review, factory: :review
    date Date.today

    factory :individual_review_with_questions do 
      # transient do
      #   questions_count 5
      # end
      after(:create) do |individual_review, evaluator|
        review = create(:review)
        section = create(:section, review: review)
        q1 = create(:question, section: section)
        q2 = create(:question, section: section)
        create(:individual_review, review: review)
      #   section = create(:section)
      #   create_list(:question, evaluator.questions_count, section: section)
      #   create_list(:section, 1, individual_review: individual_review)
      end 
    end
  end

 #  factory :individual_review_with_questions do

	# 	after(:build) do |individual_review|
	# 		section1 = create(:section, individual_review: individual_review)
	# 		question1 = create(:question, section: section1)
 #  		question2 = create(:question, section: section1)
 #  		question3 = create(:question, section: section1)
	# 	end
	# end

  factory :individual_review_with_answers do
		after(:build) do |individual_review|
			create(:review_with_questions)
  		answer1 = create(:answer, question: question1)
  		answer2 = create(:answer, question: question2)
  		answer3 = create(:answer, question: question3)
		end
	end

end
