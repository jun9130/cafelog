class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :access
      t.string :address
      t.string :business_hours
      t.string :holiday
      t.integer :seat
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
