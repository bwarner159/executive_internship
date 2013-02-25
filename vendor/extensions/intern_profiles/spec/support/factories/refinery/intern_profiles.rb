
FactoryGirl.define do
  factory :intern_profile, :class => Refinery::InternProfiles::InternProfile do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

