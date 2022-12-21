# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  avatar           :string
#  crypted_password :string
#  email            :string
#  name             :string           not null
#  role             :integer          default("general"), not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  twitter_id       :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :fans, dependent: :destroy
  has_many :favorites, through: :fans
  has_many :requests, dependent: :destroy
  has_many :request_bookmarks, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :promotions, dependent: :destroy
  has_many :promotion_bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :authentications, dependent: :destroy

  accepts_nested_attributes_for :authentications # has_many :authenticationsより下に書く

  validates :password, length: { minimum: 3 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true, if: -> { new_record? || changes[:email] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :twitter_id, uniqueness: true, if: :twitter_login?
  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end

  def twitter_login?
    !twitter_id.nil?
  end
end
