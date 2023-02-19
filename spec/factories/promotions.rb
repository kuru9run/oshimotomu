FactoryBot.define do
  factory :promotion do
    name { Faker::Lorem.characters(number: 255) }
    description { Faker::Lorem.characters(number: 65535) }
    user
  end
end