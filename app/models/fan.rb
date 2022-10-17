# == Schema Information
#
# Table name: fans
#
#  id          :bigint           not null, primary key
#  state       :integer          default("before"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  favorite_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_fans_on_favorite_id  (favorite_id)
#  index_fans_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (favorite_id => favorites.id)
#  fk_rails_...  (user_id => users.id)
#
class Fan < ApplicationRecord
  belongs_to :user
  belongs_to :favorite

  validates :favorite_id, uniqueness: { scope: :user_id }

  enum state: { before: 0, now: 1 }
end
