class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :source_id
      t.integer :target_id

      t.timestamps null: false
    end

    add_index :relationships, :source_id
    add_index :relationships, :target_id
    add_index :relationships, [:source_id, :target_id], unique: true
  end
end
