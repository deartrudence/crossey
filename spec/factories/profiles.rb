FactoryGirl.define do
  factory :profile do
    user nil
    first_name "Trudy"
    last_name "MacNabb"
    job_title "EIT2"
    job_type "Engineer"
  end

  factory :profile_job_level_1 do
    user nil
    first_name "Trudy"
    last_name "MacNabb"
    job_title "EIT1"
    job_type "Engineer"
  end
end
