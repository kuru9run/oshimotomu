require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }
  it "既定文字数内のグループ名で作成が成功すること" do
    expect(group).to be_valid
  end
  it "グループ名が空白のままで作成できないこと" do
    group.name = ''
    expect(group).to_not be_valid
  end
  it "グループ名が255文字を超えているグループが作成できないこと" do
    group.name = Faker::Lorem.characters(number: 256)
    expect(group).to_not be_valid
  end
end