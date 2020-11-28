class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name null: false
      t.text :introduction null: false
      t.integer :price null:false
      t.references :category foreign_key: true
      t.references :condition foreign_key: true
      t.references :postage foreign_key: true
      t.references :shipping_area foreign_key: true
      t.references :estimated_shipping_date foreign_key: true
      t.references :estimated_shipping_date foreign_key: true
      t.references :seller_id  foreign_key: true
      t.references :buyer_id  foreign_key: true

      t.timestamps
    end
  end
end
