class CreateDailyweathers < ActiveRecord::Migration
  def change
    create_table :dailyweathers do |t|
      t.string :apisource, :null => false, :default => ""
      t.integer :maxtemp
      t.integer :mintemp
      t.integer :wind
      t.integer :precipitationprob
      t.integer :precipitation_actual
      t.boolean :actual, :null => false, :default => false
      t.string :summary, :null => false, :default => ""
      t.string :zipcode

      t.timestamps
    end
  end
end
# rails g scaffold dailyweather apisource:string maxtemp:integer mintemp:integer wind:integer precipitationprob:integer 
# precipitation_actual:integer actual:boolean summary:string zipcode:string