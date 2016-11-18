class CreateUserHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_hobbies do |t|
      t.references :profile, foreign_key: true
      t.references :hobby, foreign_key: true

      t.timestamps
    end
  end
end
