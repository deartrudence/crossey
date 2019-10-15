FactoryBot.define do

  factory :review do
    name "Review Name"
  end

  factory :review_with_questions do
  	after(:build) do |review|
			section1 = create(:section, review: review)
			question1 = create(:question, section: section1)
  		question2 = create(:question, section: section1)
  		question3 = create(:question, section: section1)
		end
	end

end
