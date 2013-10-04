class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :board_id
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
