class CreateKeyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :key_results do |t|
      t.string :objective_id
      t.text :title

      t.timestamps
    end
  end
end
