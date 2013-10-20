class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :role_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end
  end
end
