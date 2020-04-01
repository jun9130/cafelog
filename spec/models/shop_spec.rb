require 'rails_helper'
describe Shop do
  describe '#create' do
    it "name,access,address,user_idがあれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが空の時は保存できない" do
    shop = build(:shop, name: "")
    shop.valid?
    expect(shop.errors[:name]).to include("を入力してください")
    end

    it "accessが空の時は保存できない" do
      shop = build(:shop, access: "")
      shop.valid?
      expect(shop.errors[:access]).to include("を入力してください")
      end

    it "addressが空の時は保存できない" do
      shop = build(:shop, address: "")
      shop.valid?
      expect(shop.errors[:address]).to include("を入力してください")
      end

    it "user_idが紐づいていないは保存できない" do
      shop = build(:shop, user_id: "")
      shop.valid?
      expect(shop.errors[:user]).to include("を入力してください")
      end
  end
end