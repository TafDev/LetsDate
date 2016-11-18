class AddPremiumToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :is_premium, :boolean, default: false
		add_column :accounts, :stripeid, :string
  end
end
