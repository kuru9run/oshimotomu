RSpec.describe Favorite, type: :model do
  let(:favorite_person) { build(:favorite_person) }
  let(:favorite_character) { build(:favorite_character) }
  it "推し（実在する人物）が登録できること" do
    expect(favorite_person).to be_valid
  end
  it "推し（キャラクター）が登録できること" do
    expect(favorite_character).to be_valid
  end
  it "推し氏名が空白のままで登録できないこと" do
    favorite_person.name = ''
    expect(favorite_person).to_not be_valid
  end
  it "推し氏名が255文字を超えて登録できないこと" do
    favorite_person.name = Faker::Lorem.characters(number: 256)
    expect(favorite_person).to_not be_valid
  end
end