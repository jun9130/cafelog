class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shops
  has_many :reviews
  has_many :likes
  has_many :liked_shops, through: :likes, source: :shop
  def already_liked?(shop)
    self.likes.exists?(shop_id: shop.id)
  end

  mount_uploader :user_image, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, uniqueness: true, length: { maximum: 7 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

end
