class ShopImage < ApplicationRecord
  belogs_to :shop

  validates :image, presence: true
end
