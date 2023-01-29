# == Schema Information
#
# Table name: relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follow_id   :integer
#  followed_id :integer
#
class Relationship < ApplicationRecord
  belongs_to :follow, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
