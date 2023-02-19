FactoryBot.define do
  factory :embed_youtube, class: Embed do
    identifier { Faker::Lorem.characters(number: 255) }
    embeddable_media { 0 }
    embeddable_type { 'Promotion' }
  end
  factory :embed_twitter, class: Embed do
    identifier { Faker::Lorem.characters(number: 255) }
    embeddable_media { 1 }
    embeddable_type { 'Promotion' }
  end
end