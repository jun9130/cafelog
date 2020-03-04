class Shop < ApplicationRecord
  belongs_to :user

  has_many :shop_images

  validates :name, presence: true
end
