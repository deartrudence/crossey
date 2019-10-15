FactoryBot.define do
  factory :user_role do
    name "Employee"
    association :user, factory: :user
  end
end
