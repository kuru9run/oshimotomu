RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }
  it "既定文字数内での投稿が成功すること" do
    expect(comment).to be_valid
  end
  it "本文が空白のままで投稿できないこと" do
    comment.body = ''
    expect(comment).to_not be_valid
  end
  it "本文が65535文字を超えている投稿が失敗すること" do
    comment.body = Faker::Lorem.characters(number: 65_536)
    expect(comment).to_not be_valid
  end
end