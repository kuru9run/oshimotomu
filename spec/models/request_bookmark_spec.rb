RSpec.describe RequestBookmark, type: :model do
  let(:request_bookmark) { build(:request_bookmark) }
  it "ブックマークができること" do
    expect(request_bookmark).to be_valid
  end
end