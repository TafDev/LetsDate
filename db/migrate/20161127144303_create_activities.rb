class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :activityable_type
      t.integer :activityable_id

      t.timestamps
    end
  end
end
