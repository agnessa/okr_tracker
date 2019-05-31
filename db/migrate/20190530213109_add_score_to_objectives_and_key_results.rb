class AddScoreToObjectivesAndKeyResults < ActiveRecord::Migration[5.2]
  def change
    add_column :objectives, :score, 'decimal(5,4)', null: false, default: 0
    add_column :key_results, :score, 'decimal(5,4)', null: false, default: 0
  end
end
