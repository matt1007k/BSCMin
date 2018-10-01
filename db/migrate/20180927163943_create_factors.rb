class CreateFactors < ActiveRecord::Migration[5.2]
  def change
    create_table :factors do |t|
      t.string :title
      t.integer :alta, :default => 0
      t.integer :media, :default => 0
      t.integer :baja, :default => 0
      t.integer :muy_positivo, :default => 0
      t.integer :positivo, :default => 0
      t.integer :negativo, :default => 0
      t.integer :muy_negativo, :default => 0
      t.integer :valor, :default => 0

      t.references :force, foreign_key: true

      t.timestamps
    end
  end
end
