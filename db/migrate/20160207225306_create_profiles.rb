class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer  "user_id",      null: false
      t.string   "display_name"
      t.string   "bio"
      t.string   "website"
      t.string   "location"
      t.timestamps null: false
    end
  end
end
