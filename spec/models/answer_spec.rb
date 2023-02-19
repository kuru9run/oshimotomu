RSpec.describe Answer, type: :model do
  let(:answer) { build(:answer) }
  it "既定文字数内での投稿が成功すること" do
    expect(answer).to be_valid
  end
  it "本文が空白のままで投稿できないこと" do
    answer.body = ''
    expect(answer).to_not be_valid
  end
  it "本文が65535文字を超えている投稿が失敗すること" do
    answer.body = Faker::Lorem.characters(number: 65_536)
    expect(answer).to_not be_valid
  end
end