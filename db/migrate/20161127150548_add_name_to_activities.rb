class AddNameToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :name, :string
  end
end
