# == Schema Information
#
# Table name: promotion_bookmarks
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  promotion_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_promotion_bookmarks_on_promotion_id              (promotion_id)
#  index_promotion_bookmarks_on_user_id                   (user_id)
#  index_promotion_bookmarks_on_user_id_and_promotion_id  (user_id,promotion_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (promotion_id => promotions.id)
#  fk_rails_...  (user_id => users.id)
#
class PromotionBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :promotion

  validates :user_id, uniqueness: { scope: :promotion_id }
end
