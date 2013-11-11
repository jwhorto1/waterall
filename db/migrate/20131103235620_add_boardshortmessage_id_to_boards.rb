class AddBoardshortmessageIdToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :boardshortmessage_id, :integer, :null => false, :default => 1
    add_index :boards, :boardshortmessage_id
  end                    
end
