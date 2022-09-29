# == Schema Information
#
# Table name: contents
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_contents_on_title  (title) UNIQUE
#
class Content < ApplicationRecord
  has_many :favorites
  validates :title, presence: true, uniqueness: true, length: { maximum: 255 }
end
