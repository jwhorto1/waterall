class AddNameAndDescriptionToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :name, :string, :null => false, :default => ""
    add_column :boards, :description, :text, :null => false, :default => ""
    add_column :boards, :image, :string, :null => false, :default => "default_channel_image.png"
    
  end
end
