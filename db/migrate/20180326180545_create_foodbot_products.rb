class CreateFoodbotProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :foodbot_products do |t|
      t.string :title
      t.boolean :active
    end

    add_index :foodbot_products, :title, unique: true
  end
end
