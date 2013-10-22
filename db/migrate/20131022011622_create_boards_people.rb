class CreateBoardsPeople < ActiveRecord::Migration
  def change
    create_table :boards_people do |t|
      t.belongs_to :board
      t.belongs_to :person
    end
    add_index(:boards_people, [:board_id, :person_id])
  end
end
