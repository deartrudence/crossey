FactoryBot.define do
  factory :question_job_level do
    job_level 1
    association :question, factory: :question
  end
end
