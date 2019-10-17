FactoryBot.define do
  factory :section do
    association :review, factory: :review
    title {"Section II"}
    portion {"Reviewer"}
    employee_comment {"not used"}
    reviewer_comment {"not used"}
  end
end
