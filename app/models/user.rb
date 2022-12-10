# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  avatar           :string
#  crypted_password :string
#  email            :string           not null
#  name             :string           not null
#  role             :integer          default(0), not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :fans, dependent: :destroy
  has_many :favorites, through: :fans
  has_many :requests, dependent: :destroy
  has_many :request_bookmarks, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :promotions, dependent: :destroy
  has_many :promotion_bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :password, length: { minimum: 3 }, confirmation: true, if: -> { new_record? || change[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || change[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end
end
