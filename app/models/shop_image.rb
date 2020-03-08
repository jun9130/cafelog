class ShopImage < ApplicationRecord
  belongs_to :shop, optional: true
  mount_uploader :image, ImageUploader
  
end
