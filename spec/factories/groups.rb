FactoryBot.define do
  factory :group do
    name { Faker::Lorem.characters(number: 255) }
  end
end