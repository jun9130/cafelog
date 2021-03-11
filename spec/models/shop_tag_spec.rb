require 'rails_helper'

RSpec.describe ShopTag do
  it "shop_idとtag_idがあれば登録できる" do
    shop_tag = build(:shop_tag)
    expect(shop_tag).to be_valid
  end

  it "shop_idがないと登録できない" do
    shop_tag = build(:shop_tag, shop_id: "")
    shop_tag.valid?
    expect(shop_tag.errors[:shop]).to include("を入力してください")
  end

  it "tag_idがないと登録できない" do
    shop_tag = build(:shop_tag, tag_id: "")
    shop_tag.valid?
    expect(shop_tag.errors[:tag]).to include("を入力してください")
  end
end
