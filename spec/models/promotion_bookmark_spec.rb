RSpec.describe PromotionBookmark, type: :model do
  let(:promotion_bookmark) { build(:promotion_bookmark) }
  it "ブックマークができること" do
    expect(promotion_bookmark).to be_valid
  end
end