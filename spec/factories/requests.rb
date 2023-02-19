FactoryBot.define do
  factory :request do
    title { Faker::Lorem.characters(number: 255) }
    description { Faker::Lorem.characters(number: 65535) }
    user
  end
end