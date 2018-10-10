class CreateStrengths < ActiveRecord::Migration[5.2]
  def change
    create_table :strengths do |t|
      t.string :slug
      t.text :content
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
