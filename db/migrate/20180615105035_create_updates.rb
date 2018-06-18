class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.string :cookie
      t.string :texto
      t.integer :ficheiro_id
      
      t.timestamps
    end
  end
end
