class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.text :name
      t.integer :alta, :default => 0
      t.integer :media, :default => 0
      t.integer :baja, :default => 0
      t.integer :muy_bueno, :default => 0
      t.integer :bueno, :default => 0
      t.integer :deficiente, :default => 0
      t.integer :muy_deficiente, :default => 0
      t.integer :valor, :default => 0

      t.timestamps
    end
  end
end
