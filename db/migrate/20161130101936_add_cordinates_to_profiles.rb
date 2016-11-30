class AddCordinatesToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :address, :text
    add_column :profiles, :lat, :float
    add_column :profiles, :lng, :float
  end
end
