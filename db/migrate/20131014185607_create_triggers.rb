class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.channel_idrails :int
      t.string :g
      t.string :scaffold
      t.string :trigger
      t.channel_id :int
      t.on_at :time
      t.duration :int
      t.weekday_int :int
      t.weekday_long :string
      t.enabled :bool
      t.watering_status :string
      t.details :text

      t.timestamps
    end
  end
end
