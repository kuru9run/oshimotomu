# == Schema Information
#
# Table name: promotions
#
#  id          :bigint           not null, primary key
#  decade      :integer
#  description :text
#  existence   :integer
#  gender      :integer
#  job         :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  content_id  :bigint
#  user_id     :bigint           not null
#
# Indexes
#
#  index_promotions_on_content_id  (content_id)
#  index_promotions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#  fk_rails_...  (user_id => users.id)
#
class Promotion < ApplicationRecord
  belongs_to :user
  belongs_to :content, optional: true
  has_many :comments, dependent: :destroy
  has_many :promotion_bookmarks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
  enum existence: { person: 0, character: 1 }
  enum decade: { under_ten: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, sixties: 6, seventies_and_over: 7  }
  enum gender: { male: 0, female: 1 }
  enum job: { actor: 1, voice_actor: 2, artist: 3, idol: 4 }
end
