class AddColumnToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :sex, :string
    add_column :profiles, :age, :integer
		add_column :profiles, :avatar, :string
  end
end
