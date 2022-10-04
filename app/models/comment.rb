# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  promotion_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_comments_on_promotion_id  (promotion_id)
#  index_comments_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (promotion_id => promotions.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :promotion

  validates :body, presence: true, length: { maximum: 255 }
end
