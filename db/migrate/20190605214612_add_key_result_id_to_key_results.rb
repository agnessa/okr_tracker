class AddKeyResultIdToKeyResults < ActiveRecord::Migration[5.2]
  def change
    add_column :key_results, :uid, :string
  end
end
