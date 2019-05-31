class SortOutPrimaryKeys < ActiveRecord::Migration[5.2]
  def change
    Objective.all.each do |o|
      o.update_attribute(:uid, SecureRandom.uuid) if o.uid.blank?
    end
    KeyResult.all.each do |kr|
      kr.update_attribute(:uid, SecureRandom.uuid) if kr.uid.blank?
    end

    execute 'ALTER TABLE objectives DROP CONSTRAINT objectives_pkey'
    remove_column :objectives, :id
    rename_column :objectives, :uid, :id
    execute 'ALTER TABLE objectives ALTER COLUMN id TYPE uuid USING id::uuid, ALTER COLUMN id SET NOT NULL'
    execute 'ALTER TABLE objectives ADD CONSTRAINT objectives_pkey PRIMARY KEY (id)'

    execute 'ALTER TABLE key_results DROP CONSTRAINT key_results_pkey'
    remove_column :key_results, :id
    rename_column :key_results, :uid, :id
    execute 'ALTER TABLE key_results ALTER COLUMN id TYPE uuid USING id::uuid, ALTER COLUMN id SET NOT NULL'
    execute 'ALTER TABLE key_results ADD CONSTRAINT key_results_pkey PRIMARY KEY (id)'
  end
end
