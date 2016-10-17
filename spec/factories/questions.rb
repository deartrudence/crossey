FactoryGirl.define do
  factory :question do
    subsection "Subsection 1"
    job_type "Engineering"
    question_text "This is my question?"
    question_type "check_box"
    association :section, factory: :section
  end
end
