class CreateOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :opportunities do |t|
      t.string :slug
      t.text :content
      t.references :factor, foreign_key: true

      t.timestamps
    end
  end
end
