class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :name
      t.text :mission
      t.text :vision
      t.string :macroproceso

      t.timestamps
    end
  end
end
