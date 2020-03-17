class Shop < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :reviews
  has_many :shop_images, dependent: :destroy
  accepts_nested_attributes_for :shop_images

  validates :name, presence: true
end
