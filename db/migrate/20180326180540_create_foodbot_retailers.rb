class CreateFoodbotRetailers < ActiveRecord::Migration[5.1]
  def change
    create_table :foodbot_retailers do |t|
      t.string :title
      t.string :url
      t.string :day
      t.boolean :active
    end

    add_index :foodbot_retailers, :title, unique: true
  end
end
