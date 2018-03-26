class CreateOctobotTrends < ActiveRecord::Migration[5.1]
  def change
    create_table :octobot_trends do |t|
      t.belongs_to :language
      t.string :title
      t.text :description
      t.string :language_selector
      t.string :link
      t.integer :stars
      t.integer :forks
      t.string :stats
      t.boolean :checked
      t.date :download_date
    end

    add_index :octobot_trends, :title, unique: true
  end
end
