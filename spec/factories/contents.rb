FactoryBot.define do
  factory :content do
    title { Faker::Lorem.characters(number: 255) }
  end
end