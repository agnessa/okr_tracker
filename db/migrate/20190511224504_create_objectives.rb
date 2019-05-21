class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :uid
      t.text :title
      t.integer :user_id
      t.date :quarter_start_date

      t.timestamps
    end
  end
end
