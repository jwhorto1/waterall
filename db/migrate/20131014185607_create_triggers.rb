class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.integer :channel_id, :null => false, :default => 0
      t.integer :weekday_id, :null => false, :default => 0
      t.time :on_at#x = '%02d' % t.hour 2 digigt times (03, 07 etc)
      t.integer :duration, :null => false, :default => 0
      t.integer :weekday_int
      t.string :weekday_string, :null => false, :default => ""
      t.boolean :enabled, :null => false, :default => true
      t.string :short_status, :null => false, :default => ""
      t.text :details, :null => false, :default => ""

      t.timestamps
    end
  end
end
#rails g scaffold weekday channel_id:integer day_int:integer day_short:string day_long:string