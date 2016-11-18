class AddColumnToHobbies < ActiveRecord::Migration[5.0]
  def change
    add_reference :hobbies, :profile, foreign_key: true
  end
end
