RSpec.describe Fan, type: :model do
  let(:fan_before) { build(:fan_before) }
  let(:fan_now) { build(:fan_now) }
  it "以前の推しを登録できること" do
    expect(fan_before).to be_valid
  end
  it "現在の推しを登録できること" do
    expect(fan_now).to be_valid
  end
end