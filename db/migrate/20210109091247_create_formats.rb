class CreateFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :formats do |t|
      t.string :name
      t.string :char
      t.integer :han
      t.text :exp
      t.timestamps
    end
  end
end
