require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user_a) { create(:user, name: 'フォロイー', email: 'follow_test@example.com', password: 'password' ) }
  let(:user_b) { create(:user, name: 'フォワー', email: 'followed_test@example.com', password: 'password') }
  let(:relationship) { build(:relationship, follow_id: user_a.id, followed_id: user_b.id) }
  it "自分以外のユーザーをフォローできること" do
    expect(relationship).to be_valid
  end
end