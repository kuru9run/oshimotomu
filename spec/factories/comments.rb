FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.characters(number: 65535) }
    user
    promotion
  end
end