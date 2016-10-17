FactoryGirl.define do
  factory :section_answer do
    association :section, factory: :section
    association :individual_review, factory: :individual_review
    employee_comment "This is the employee comment"
    reviewer_comment "This is the reviewer comment"
  end
end
