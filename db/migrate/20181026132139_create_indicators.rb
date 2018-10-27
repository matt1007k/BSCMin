class CreateIndicators < ActiveRecord::Migration[5.2]
  def change
    create_table :indicators do |t|
      t.references :objective, foreign_key: true
      t.string :aclarar
      t.string :variable
      t.string :indicador
      t.string :tipo, :null => true
      #Ex:- :null => false

      t.timestamps
    end
  end
end
