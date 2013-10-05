class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :board_id
      t.integer :number
      t.string :name
      t.string :channel_image

      t.timestamps
    end
  end
end
