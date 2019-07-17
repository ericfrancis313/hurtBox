class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.belongs_to :variation
      
      t.string :name, null:false
      t.string :input,null:false

      t.timestamps
    end
  end
end
