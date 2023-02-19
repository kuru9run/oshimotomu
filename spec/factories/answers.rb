FactoryBot.define do
  factory :answer do
    body { Faker::Lorem.characters(number: 65535) }
    user
    request
  end
end