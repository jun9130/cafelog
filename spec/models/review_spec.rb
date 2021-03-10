require 'rails_helper'
RSpec.describe Review do
  describe '#create' do
    it "レビュー,user_id,shop_idがあれば登録ができる" do
      review = build(:review)
      expect(review).to be_valid
    end

    it "レビューがブランクだと登録ができない" do
      review = build(:review, text: "")
      review.valid?
      expect(review.errors[:text]).to include("を入力してください")
    end
    
    it "user_idが存在しないと登録ができない" do
      review = build(:review, user_id: "")
      review.valid?
      expect(review.errors[:user]).to include("を入力してください")
    end
    
    it "shop_idが存在しないと登録ができない" do
      review = build(:review, shop_id: "")
      review.valid?
      expect(review.errors[:shop]).to include("を入力してください")
    end
  end
end
