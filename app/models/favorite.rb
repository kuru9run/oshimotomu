# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  decade     :integer          not null
#  gender     :integer          not null
#  job        :integer
#  name       :string           not null
#  type       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content_id :bigint
#
# Indexes
#
#  index_favorites_on_content_id  (content_id)
#
# Foreign Keys
#
#  fk_rails_...  (content_id => contents.id)
#
class Favorite < ApplicationRecord
  has_many :fans
  belongs_to :content

  enum type: { person: 0, character: 1 }
  enum decade: { under_ten: 0, teens: 1, twenties: 2, thirties: 3, forties: 4, fifties: 5, sixties: 6, seventies_and_over: 7  }
  enum gender: { male: 0, female: 1 }
end
