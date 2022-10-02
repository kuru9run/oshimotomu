# == Schema Information
#
# Table name: request_bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  request_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_request_bookmarks_on_request_id  (request_id)
#  index_request_bookmarks_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_id => requests.id)
#  fk_rails_...  (user_id => users.id)
#
class RequestBookmark < ApplicationRecord
  belongs_to :user
  belongs_to :request
end
