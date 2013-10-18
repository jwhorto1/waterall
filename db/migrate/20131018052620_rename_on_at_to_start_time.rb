class RenameOnAtToStartTime < ActiveRecord::Migration
  def change
    rename_column :triggers, :on_at, :start_time
  end
end
