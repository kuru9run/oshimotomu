RSpec.describe Request, type: :model do
  let(:request) { build(:request) }
  it "既定文字数内での投稿が成功すること" do
    expect(request).to be_valid
  end
  it "タイトルが空白のままで投稿できないこと" do
    request.title = ''
    expect(request).to_not be_valid
  end
  it "募集詳細が65535文字を超えている投稿が失敗すること" do
    request.description = Faker::Lorem.characters(number: 65_536)
    expect(request).to_not be_valid
  end
end