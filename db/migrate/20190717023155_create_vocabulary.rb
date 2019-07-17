class CreateVocabulary < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabularies do |t|
      t.string :word, null:false
      t.string :definition, null:false

      t.timestamps
    end
  end
end
