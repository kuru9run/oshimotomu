FactoryBot.define do
  factory :fan_before, class: Fan do
    user
    favorite_id { create(:favorite_person).id }
    state { 0 }
  end
  factory :fan_now, class: Fan do
    user
    favorite_id { create(:favorite_person).id }
    state { 1 }
  end
end