# == Schema Information
#
# Table name: requests
#
#  id          :bigint           not null, primary key
#  decade      :integer
#  description :text
#  existence   :integer
#  gender      :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Request < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :request_bookmarks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
  enum existence: { person: 0, character: 1 }
  enum decade: { under_ten: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, sixties: 6, seventies_and_over: 7  }
  enum gender: { male: 0, female: 1 }
end
