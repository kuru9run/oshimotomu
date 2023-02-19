require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:content) { build(:content) }
  it "既定文字数内のタイトルで作成が成功すること" do
    expect(content).to be_valid
  end
  it "タイトルが空白のままで作成できないこと" do
    content.title = ''
    expect(content).to_not be_valid
  end
  it "タイトルが255文字を超えている作品が作成できないこと" do
    content.title = Faker::Lorem.characters(number: 256)
    expect(content).to_not be_valid
  end
end