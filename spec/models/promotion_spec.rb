RSpec.describe Promotion, type: :model do
  let(:promotion) { build(:promotion) }
  it "既定文字数内での投稿が成功すること" do
    expect(promotion).to be_valid
  end
  it "推し氏名が空白のままで投稿できないこと" do
    promotion.name = ''
    expect(promotion).to_not be_valid
  end
  it "布教内容が65535文字を超えている投稿が失敗すること" do
    promotion.description = Faker::Lorem.characters(number: 65_536)
    expect(promotion).to_not be_valid
  end
end