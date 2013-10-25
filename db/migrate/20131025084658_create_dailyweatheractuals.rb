class CreateDailyweatheractuals < ActiveRecord::Migration
  def change
    create_table :dailyweatheractuals do |t|
      t.integer :maxtemp
      t.integer :mintemp
      t.string :zipcode
      t.integer :wind
      t.integer :precipitation
      t.string :summary, :null => false, :default => ""
      t.string :apisource, :null => false, :default => ""

      t.timestamps
    end
  end
end
