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
  belongs_to :content
end
