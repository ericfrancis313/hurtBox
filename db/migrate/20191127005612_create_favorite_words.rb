class CreateFavoriteWords < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_words do |t|
      t.belongs_to :vocabulary
      t.belongs_to :user

      t.boolean :selected, null:false      
    end
  end
end
