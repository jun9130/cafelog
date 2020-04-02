class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :text, presence: { message: "を入力してください"}
end
