FactoryBot.define do
  factory :favorite_person, class: Favorite do
    name { Faker::Lorem.characters(number: 255) }
    existence { 0 }
    decade { rand(0..7) }
    gender { rand(0..1) }
    group
  end
  factory :favorite_character, class: Favorite do
    name { Faker::Lorem.characters(number: 255) }
    existence { 1 }
    decade { rand(0..7) }
    gender { rand(0..1) }
    content
  end
end