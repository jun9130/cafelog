class Shop < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :reviews
  has_many :shop_images, dependent: :destroy
  accepts_nested_attributes_for :shop_images

  has_many :shop_tags, dependent: :destroy
  has_many :tags, through: :shop_tags

  validates :name, presence: true
  validates :access, presence: true
  validates :address, presence: true
end
