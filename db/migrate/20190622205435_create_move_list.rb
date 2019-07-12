class CreateMoveList < ActiveRecord::Migration[5.2]
  def change
    create_table :move_lists do |t|
      t.belongs_to :characters

      t.string :name, null:false
      t.string :input,null:false

      t.timestamps
    end
  end
end
