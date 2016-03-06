class AddTypeToRelationship < ActiveRecord::Migration
  def change
    add_column :relationships, :type, :string, null: false, default: ""

    remove_index :relationships, [:source_id, :target_id]
    add_index :relationships, [:source_id, :target_id, :type], unique: true
  end
end
