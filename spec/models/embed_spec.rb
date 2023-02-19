RSpec.describe Embed, type: :model do
  let(:embed_youtube) { build(:embed_youtube) }
  let(:embed_twitter) { build(:embed_twitter) }
  let(:promotion) { create(:promotion) }
  it "Youtube埋め込みできること" do
    embed_youtube.embeddable_id = promotion.id
    expect(embed_youtube).to be_valid
  end
  it "Twitter埋め込みできること" do
    embed_twitter.embeddable_id = promotion.id
    expect(embed_twitter).to be_valid
  end
end