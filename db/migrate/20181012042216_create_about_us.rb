class CreateAboutUs < ActiveRecord::Migration[5.2]
  def change
    create_table :about_us do |t|
      t.string :name
      t.text :mission
      t.text :vision
      t.string :macroproceso

      t.timestamps
    end
  end
end
