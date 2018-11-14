class CreateDatos < ActiveRecord::Migration[5.2]
  def change
    create_table :datos do |t|
      t.references :indicator, foreign_key: true
      t.integer :anio
      t.integer :enero, default: 0
      t.integer :febrero, default: 0
      t.integer :marzo, default: 0
      t.integer :abril, default: 0
      t.integer :mayo, default: 0
      t.integer :junio, default: 0
      t.integer :julio, default: 0
      t.integer :agosto, default: 0
      t.integer :septiembre, default: 0
      t.integer :octubre, default: 0
      t.integer :noviembre, default: 0
      t.integer :diciembre, default: 0
      t.integer :total, default: 0
      t.decimal :porcentaje, :precision => 7, :scale => 2, default: 0.00
      t.integer :anterior, default: 0
      #Ex:- :null => false

      t.timestamps
    end
  end
end
