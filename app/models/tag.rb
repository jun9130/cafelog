class Tag < ApplicationRecord
  has_many :shop_tags, dependent: :destroy
  has_many :shops, through: :shop_tags
end
