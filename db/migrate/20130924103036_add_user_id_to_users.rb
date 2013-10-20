class AddUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school_id, :integer, :null => false, :default => 0
    
  end
end
