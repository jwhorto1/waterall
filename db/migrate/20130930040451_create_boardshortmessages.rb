class CreateBoardshortmessages < ActiveRecord::Migration
  def change
    create_table :boardshortmessages do |t|
      t.string :channel1_on_in_seconds, :null => false, :default => 0
      t.string :channel2_on_in_seconds, :null => false, :default => 0
      t.string :channel3_on_in_seconds, :null => false, :default => 0
      t.string :channel4_on_in_seconds, :null => false, :default => 0
      t.string :channel5_on_in_seconds, :null => false, :default => 0
      t.string :channel6_on_in_seconds, :null => false, :default => 0
      t.string :channel7_on_in_seconds, :null => false, :default => 0
      t.string :channel8_on_in_seconds, :null => false, :default => 0
      t.datetime :date
      #for board setup
      t.integer :board_id, :null => false, :default => 0
      t.integer :randomaccesscode, :null => false, :default => 8888
      t.integer :scalediv32, :null => false, :default => 8888
      t.integer :year, :null => false, :default => 8888
      t.integer :month, :null => false, :default => 8888
      t.integer :day, :null => false, :default => 8888
      t.integer :hour, :null => false, :default => 8888
      t.integer :minute, :null => false, :default => 8888
      t.integer :second, :null => false, :default => 8888
      t.integer :channel1, :null => false, :default => 8888
      t.integer :channel2, :null => false, :default => 8888
      t.integer :channel3, :null => false, :default => 8888
      t.integer :channel4, :null => false, :default => 8888
      t.integer :channel5, :null => false, :default => 8888
      t.integer :channel6, :null => false, :default => 8888
      t.integer :channel7, :null => false, :default => 8888
      t.integer :channel8, :null => false, :default => 8888
      t.integer :sendstatus, :null => false, :default => 8888
      t.integer :echo, :null => false, :default => 8888
      t.integer :willsend, :null => false, :default => 8888
      t.integer :checksum, :null => false, :default => 8888
      #full message
      t.string :concatinated_board_ascii, :null => false, :default => ""
      #other
      t.timestamps
    end
  end
end
