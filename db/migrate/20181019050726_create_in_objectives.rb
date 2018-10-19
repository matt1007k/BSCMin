class CreateInObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :in_objectives do |t|
      t.references :objective, foreign_key: true
      t.references :strategy, foreign_key: true

      t.timestamps
    end
  end
end
