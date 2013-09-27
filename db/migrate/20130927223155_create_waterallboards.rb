class CreateWaterallboards < ActiveRecord::Migration
  def change
    create_table :waterallboards do |t|
      t.float :latitude, :null => false, :default => ""
      t.float :longitude, :null => false, :default => ""
      t.string :address, :null => false, :default => ""
      t.string :zipcode, :null => false, :default => ""
      t.string :boardnumber, :null => false, :default => ""
      t.string :boardmodel, :null => false, :default => ""
      t.integer :person_id, :null => false, :default => 0
      t.integer :channels, :null => false, :default => 0
      t.string :ip, :null => false, :default => ""
      t.string :status, :null => false, :default => ""
      t.string :googlemap_url, :null => false, :default => ""
      
      t.timestamps
    end
    
  end
end
