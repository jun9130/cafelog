class CreateShopImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_images do |t|
      t.string :image
      t.references :shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end
