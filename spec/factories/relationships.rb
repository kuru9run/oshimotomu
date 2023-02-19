FactoryBot.define do
  factory :relationship do
    follow_id { 1 }
    followed_id { 2 }
  end
end