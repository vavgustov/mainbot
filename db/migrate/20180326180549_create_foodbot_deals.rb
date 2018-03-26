class CreateFoodbotDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :foodbot_deals do |t|
      t.belongs_to :product
      t.belongs_to :retailer
      t.string :description
      t.string :image
      t.string :discount
      t.string :price_new
      t.string :price_old
      t.string :quantity
      t.string :date
      t.date :download_date
    end
  end
end
