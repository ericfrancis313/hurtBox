class CreateVariations < ActiveRecord::Migration[5.2]
  def change
    create_table :variations do |t|

      t.belongs_to :game
      t.belongs_to :character
    end
  end
end
