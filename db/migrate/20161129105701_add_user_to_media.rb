class AddUserToMedia < ActiveRecord::Migration[5.0]
  def change
    add_reference :media, :user, foreign_key: true
  end
end
