class CreateSubProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_processes do |t|
      t.string :title
      t.references :processing, foreign_key: true

      t.timestamps
    end
  end
end
