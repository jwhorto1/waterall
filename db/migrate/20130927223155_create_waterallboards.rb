class CreateWaterallboards < ActiveRecord::Migration
  def change
    create_table :waterallboards do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :zipcode
      t.string :boardnumber
      t.string :boardmodel
      t.integer :person_id
      t.integer :channels
      t.string :ip
      t.string :status
      
      t.timestamps
    end
    
  end
end
