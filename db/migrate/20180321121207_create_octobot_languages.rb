class CreateOctobotLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :octobot_languages do |t|
      t.string :title
      t.boolean :active
    end
  end
end
