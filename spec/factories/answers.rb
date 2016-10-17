FactoryGirl.define do
  factory :answer do
    association :question, factory: :question
    association :individual_review, factory: :individual_review
    answer "Meets Expectations"
  end
end
