class Shop < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :reviews
  has_many :shop_images, dependent: :destroy
  accepts_nested_attributes_for :shop_images

  has_many :shop_tags, dependent: :destroy
  has_many :tags, through: :shop_tags
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  validates :name, presence: { message: "を入力してください" }
  validates :access, presence: { message: "を入力してください" }
  validates :address, presence: { message: "を入力してください" }
end
