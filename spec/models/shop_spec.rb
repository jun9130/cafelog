require 'rails_helper'
describe Shop do
  describe '#create' do
    it "店名,最寄駅,住所,user_idがあれば登録ができる" do
      shop = build(:shop)
      expect(shop).to be_valid
    end

    it "店名がブランクだと登録ができない" do
    shop = build(:shop, name: "")
    shop.valid?
    expect(shop.errors[:name]).to include("を入力してください")
    end

    it "最寄駅がブランクだと登録ができない" do
      shop = build(:shop, access: "")
      shop.valid?
      expect(shop.errors[:access]).to include("を入力してください")
      end

    it "住所がブランクだと登録ができない" do
      shop = build(:shop, address: "")
      shop.valid?
      expect(shop.errors[:address]).to include("を入力してください")
      end

    it "user_idが存在しないと登録ができない" do
      shop = build(:shop, user_id: "")
      shop.valid?
      expect(shop.errors[:user]).to include("を入力してください")
      end
  end
end