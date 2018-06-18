class CreateFicheiros < ActiveRecord::Migration[5.2]
  def change
    create_table :ficheiros do |t|
      t.string :path
      t.integer :zip, default:0
      t.string :zip_path
      t.timestamps
    end
  end
end
