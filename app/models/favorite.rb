# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  decade     :integer          not null
#  existence  :integer          not null
#  gender     :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content_id :bigint
#  group_id   :bigint
#
# Indexes
#
#  index_favorites_on_content_id  (content_id)
#  index_favorites_on_group_id    (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#  fk_rails_...  (group_id => groups.id)
#
class Favorite < ApplicationRecord
  has_many :fans, dependent: :destroy
  has_many :users, through: :fans
  belongs_to :content, optional: true
  belongs_to :group, optional: true

  validates :name, uniqueness: { scope: [:existence, :gender, :group_id, :content_id] }
  validates :name, presence: true
  validates :decade, presence: true
  validates :existence, presence: true
  validates :gender, presence: true
  enum existence: { person: 0, character: 1 }
  enum decade: { under_ten: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, sixties: 6, seventies_and_over: 7  }
  enum gender: { male: 0, female: 1 }
end
