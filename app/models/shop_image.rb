class ShopImage < ApplicationRecord
  belogs_to :shop
  mount_uploader :image, ImageUploader
  
  validates :image, presence: true
end
