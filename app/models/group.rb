# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_name  (name) UNIQUE
#
class Group < ApplicationRecord
  has_many :favorites
  has_many :promotions

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
end
