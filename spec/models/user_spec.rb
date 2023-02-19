RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  it "ユーザーの作成が成功すること" do
    expect(user).to be_valid
  end
  it "パスワードが3文字未満で登録できないこと" do
    user.password = 'aa'
    user.password_confirmation = 'aa'
    expect(user).to_not be_valid
  end
  it "パスワード確認用がパスワードと一致していないと登録できないこと" do
    user.password_confirmation = 'password_miss'
    expect(user).to_not be_valid
  end
  it "ユーザー名が空白で登録できないこと" do
    user.name = ''
    expect(user).to_not be_valid
  end
  it "メールアドレスが空白で登録できないこと" do
    user.email = ''
    expect(user).to_not be_valid
  end
end