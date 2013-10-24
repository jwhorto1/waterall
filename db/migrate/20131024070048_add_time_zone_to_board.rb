class AddTimeZoneToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :timezone, :string,:default => 'Pacific Time (US & Canada)', :limit => 255
  end
end
