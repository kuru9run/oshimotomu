# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  request_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_answers_on_request_id  (request_id)
#  index_answers_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_id => requests.id)
#  fk_rails_...  (user_id => users.id)
#
class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :request
end
