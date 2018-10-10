class CreateStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :strategies do |t|
      t.string :foda
      t.string :type
      t.text :content
      t.references :objective, foreign_key: true

      t.timestamps
    end
  end
end
