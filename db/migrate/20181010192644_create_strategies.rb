class CreateStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :strategies do |t|
      t.string :foda
      t.string :tipo
      t.text :content

      t.timestamps
    end
  end
end
