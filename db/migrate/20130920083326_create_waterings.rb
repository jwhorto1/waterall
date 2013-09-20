class CreateWaterings < ActiveRecord::Migration
  def change
    create_table :waterings do |t|
      t.datetime :time
      t.integer :version
      t.integer :channel
      t.integer :user_id

      t.timestamps
    end
  end
end
