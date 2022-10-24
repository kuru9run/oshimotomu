# == Schema Information
#
# Table name: embeds
#
#  id              :bigint           not null, primary key
#  embeddable_type :string
#  identifier      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  embeddable_id   :bigint
#
# Indexes
#
#  index_embeds_on_embeddable  (embeddable_type,embeddable_id)
#
class Embed < ApplicationRecord
  belongs_to :embeddable, polymorphic: true

  with_options on: %i[create update] do
    validates :embeddable_id, presence: true
    validates :embeddable_type, presence: true
  end

  def youtube_id
    identifier.split('/').last.gsub('watch?v=', '')
  end
end
