class CreateFichas < ActiveRecord::Migration[5.2]
  def change
    create_table :fichas do |t|
      t.string :unidad
      t.string :tiempo
      t.integer :meta
      t.string :verde
      t.string :amarillo
      t.string :rojo
      t.references :indicator, foreign_key: true

      t.timestamps
    end
  end
end
