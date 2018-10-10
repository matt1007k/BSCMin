class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :slug
      t.text :content
      t.references :perspective, foreign_key: true

      t.timestamps
    end
  end
end
